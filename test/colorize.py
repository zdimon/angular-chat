class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

    @staticmethod
    def blue(mes):
        print '%s %s %s' % (bcolors.OKBLUE, mes, bcolors.ENDC)

    @staticmethod
    def green(mes):
        print '%s %s %s' % (bcolors.OKGREEN, mes, bcolors.ENDC)

    @staticmethod
    def red(mes):
        print '%s %s %s' % (bcolors.FAIL, mes, bcolors.ENDC)

