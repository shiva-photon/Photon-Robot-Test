#!/usr/bin/env python
import sys
import termios
import contextlib
from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
from  AppiumLibrary.keywords._screenshot import _ScreenshotKeywords
@contextlib.contextmanager
def raw_mode(file):
    old_attrs = termios.tcgetattr(file.fileno())
    new_attrs = old_attrs[:]
    new_attrs[3] = new_attrs[3] & ~(termios.ECHO | termios.ICANON)
    try:
        termios.tcsetattr(file.fileno(), termios.TCSADRAIN, new_attrs)
        yield
    finally:
        termios.tcsetattr(file.fileno(), termios.TCSADRAIN, old_attrs)


def main():
    newlib = BuiltIn().get_library_instance("AppiumLibrary")
    logger.console('exit with ^C or ^D')
    #print 'exit with ^C or ^D'
    with raw_mode(sys.stdin):
        try:
            while True:
                ch = sys.stdin.read(1)
                if not ch or ch == chr(4):
                    break
                logger.console('%02x' % ord(ch),)
                if not  ch == '0a':
                    logger.write('Enter Pressed')

                    newlib.capture_page_screenshot()

        except (KeyboardInterrupt, EOFError):
            pass


if __name__ == '__main__':
    main()
