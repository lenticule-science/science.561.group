class SemioticMarkdownError(Exception):
    pass


class FrontmatterParseError(SemioticMarkdownError):
    pass


class FrontmatterTypeError(SemioticMarkdownError):
    pass


class DuplicateDocIdError(SemioticMarkdownError):
    pass


class AmbiguousResolutionKeyError(SemioticMarkdownError):
    pass


class InvalidEncodingError(SemioticMarkdownError):
    pass
