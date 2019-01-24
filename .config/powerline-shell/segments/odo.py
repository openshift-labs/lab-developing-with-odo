from powerline_shell.utils import ThreadedSegment
import os
import subprocess


class Segment(ThreadedSegment):
    def add_to_powerline(self):
        app = ''
        project = ''
        try:
            p = subprocess.Popen(['odo', 'project', '-q', '--skip-connection-check'],
                    stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            project =  p.communicate()[0].decode("utf-8").rstrip('\n')
            if p.returncode != 0:
               project = ''
            p = subprocess.Popen(['odo', 'app', '-q', '--skip-connection-check'],
                    stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            app = p.communicate()[0].decode("utf-8").rstrip('\n')
            if p.returncode != 0:
                app = ''
        except Exception as e:
            return
        if project != '' or app != '':
            odo_str = u' odo[{}/{}] '.format(app, project)
            self.powerline.append(odo_str,
                              self.powerline.theme.AWS_PROFILE_FG,
                              self.powerline.theme.AWS_PROFILE_BG)