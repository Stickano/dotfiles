# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import *
import ranger.api
import ranger.core.linemode
import os
from ranger.core.loader import CommandLoader


class toggle_flat(Command):
    """
    :toggle_flat

    Flattens or unflattens the directory view.
    """

    def execute(self):
        if self.fm.thisdir.flat == 0:
            self.fm.thisdir.unload()
            self.fm.thisdir.flat = -1
            self.fm.thisdir.load_content()
        else:
            self.fm.thisdir.unload()
            self.fm.thisdir.flat = 0
            self.fm.thisdir.load_content()


# Linemode: Meta Comments
@ranger.api.register_linemode     # It may be used as a decorator too!
class MyLinemode(ranger.core.linemode.LinemodeBase):
    name = "metacomment"

    uses_metadata = True
    required_metadata = ["comment"]

    def filetitle(self, file, metadata):
        return file.relative_path + " (" + metadata.comment + ")"

    def infostring(self, file, metadata):
        return file.user


# Linemode: Meta author
class MyLinemode(ranger.core.linemode.LinemodeBase):
    name = "metaauthor"

    uses_metadata = True
    required_metadata = ["author"]

    def filetitle(self, file, metadata):
        return file.relative_path + " (" + metadata.author + ")"

    def infostring(self, file, metadata):
        return file.user


# Linemode: Meta year
class MyLinemode(ranger.core.linemode.LinemodeBase):
    name = "metayear"

    uses_metadata = True
    required_metadata = ["year"]

    def filetitle(self, file, metadata):
        return file.relative_path + " (" + metadata.year + ")"

    def infostring(self, file, metadata):
        return file.user


# Search files/folders
class fzf_select(Command):
    """
    :fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        if self.quantifier:
            # match only directories
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        else:
            # match files and directories
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)


class toggle_under(Command):
    """
    :toggle_under

    Changes the name of currently highlighted files from foo_bar_baz.txt to
    foo-bar-baz.txt and vice versa.
    """

    def execute(self):
        from ranger.fsobject import File
        from os import access

        # yes, this is pathetic
        s = str(self.fm.env.cf)
        s1 = s.replace('-', '_')
        s2 = s.replace('_', '-')
        new_name = ''.join([b if a != b else c for (a,b,c) in zip(s,s1,s2)])

        if access(new_name, os.F_OK):
            return

        self.fm.rename(self.fm.env.cf, new_name)
        f = File(new_name)
        self.fm.env.cwd.pointed_obj = f
        self.fm.env.cf = f


class toggle_space(Command):
    """
    :toggle_space

    Changes the name of currently highlighted files from 'foo bar baz.txt' to
    foo-bar-baz.txt and vice versa.
    """

    def execute(self):
        from ranger.fsobject import File
        from os import access

        # yes, this is pathetic
        s = str(self.fm.env.cf)
        s1 = s.replace('-', '  ')
        s2 = s.replace('  ', '-')
        new_name = ''.join([b if a != b else c for (a,b,c) in zip(s,s1,s2)])

        if access(new_name, os.F_OK):
            return

        self.fm.rename(self.fm.env.cf, new_name)
        f = File(new_name)
        self.fm.env.cwd.pointed_obj = f
        self.fm.env.cf = f

class empty(Command):
    """:empty

    Empties the trash directory ~/.Trash
    """

    def execute(self):
        self.fm.run("rm -rf /home/stick/.Trash/{*,.[^.]*}")



class extracthere(Command):
    def execute(self):
        """ Extract copied files to current directory """
        copied_files = tuple(self.fm.copy_buffer)

        if not copied_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        one_file = copied_files[0]
        cwd = self.fm.thisdir
        original_path = cwd.path
        au_flags = ['-X', cwd.path]
        au_flags += self.line.split()[1:]
        au_flags += ['-e']

        self.fm.copy_buffer.clear()
        self.fm.cut_buffer = False
        if len(copied_files) == 1:
            descr = "extracting: " + os.path.basename(one_file.path)
        else:
            descr = "extracting files from: " + os.path.basename(one_file.dirname)
        obj = CommandLoader(args=['aunpack'] + au_flags \
                + [f.path for f in copied_files], descr=descr)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)



class compress(Command):
    def execute(self):
        """ Compress marked files to current directory """
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        au_flags = parts[1:]

        descr = "compressing files in: " + os.path.basename(parts[1])
        obj = CommandLoader(args=['apack'] + au_flags + \
                [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

    def tab(self):
        """ Complete with current folder name """

        extension = ['.zip', '.tar.gz', '.rar', '.7z']
        return ['compress ' + os.path.basename(self.fm.thisdir.path) + ext for ext in extension]
