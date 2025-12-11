# logging_config.py
import logging
import sys

RESET = "\033[0m"

COLORS = {
    "DEBUG": "\033[37m",    # gray FG
    "INFO": "\033[36m",     # cyan FG
    "WARNING": "\033[33m",  # yellow FG
    "ERROR": "\033[31m",    # red FG
    "CRITICAL": "\033[41m", # red BG
}


class ColorFormatter(logging.Formatter):
    def format(self, record: logging.LogRecord) -> str:
        # Color based on log level
        color = COLORS.get(record.levelname, RESET)
        message = super().format(record)
        # Apply color to line
        return f"{color}{message}{RESET}"


def setup_logging(level: int = logging.DEBUG) -> None:
    """Configure logger."""
    log_format = "%(asctime)s - FROM %(filename)s - %(message)s (%(funcName)s)"

    handler = logging.StreamHandler(sys.stdout)
    handler.setFormatter(ColorFormatter(log_format, datefmt="%H:%M:%S"))

    root_logger = logging.getLogger()
    root_logger.handlers.clear()
    root_logger.setLevel(level)
    root_logger.addHandler(handler)
