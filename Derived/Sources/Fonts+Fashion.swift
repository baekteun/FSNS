// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(OSX)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
public enum FashionFontFamily {
  public enum Roboto {
    public static let black = FashionFontConvertible(name: "Roboto-Black", family: "Roboto", path: "Roboto-Black.ttf")
    public static let blackItalic = FashionFontConvertible(name: "Roboto-BlackItalic", family: "Roboto", path: "Roboto-BlackItalic.ttf")
    public static let bold = FashionFontConvertible(name: "Roboto-Bold", family: "Roboto", path: "Roboto-Bold.ttf")
    public static let boldItalic = FashionFontConvertible(name: "Roboto-BoldItalic", family: "Roboto", path: "Roboto-BoldItalic.ttf")
    public static let italic = FashionFontConvertible(name: "Roboto-Italic", family: "Roboto", path: "Roboto-Italic.ttf")
    public static let light = FashionFontConvertible(name: "Roboto-Light", family: "Roboto", path: "Roboto-Light.ttf")
    public static let lightItalic = FashionFontConvertible(name: "Roboto-LightItalic", family: "Roboto", path: "Roboto-LightItalic.ttf")
    public static let medium = FashionFontConvertible(name: "Roboto-Medium", family: "Roboto", path: "Roboto-Medium.ttf")
    public static let mediumItalic = FashionFontConvertible(name: "Roboto-MediumItalic", family: "Roboto", path: "Roboto-MediumItalic.ttf")
    public static let regular = FashionFontConvertible(name: "Roboto-Regular", family: "Roboto", path: "Roboto-Regular.ttf")
    public static let thin = FashionFontConvertible(name: "Roboto-Thin", family: "Roboto", path: "Roboto-Thin.ttf")
    public static let thinItalic = FashionFontConvertible(name: "Roboto-ThinItalic", family: "Roboto", path: "Roboto-ThinItalic.ttf")
    public static let all: [FashionFontConvertible] = [black, blackItalic, bold, boldItalic, italic, light, lightItalic, medium, mediumItalic, regular, thin, thinItalic]
  }
  public enum Supermercado {
    public static let regular = FashionFontConvertible(name: "Supermercado-Regular", family: "Supermercado", path: "SupermercadoOne-Regular.ttf")
    public static let all: [FashionFontConvertible] = [regular]
  }
  public static let allCustomFonts: [FashionFontConvertible] = [Roboto.all, Supermercado.all].flatMap { $0 }
  public static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

public struct FashionFontConvertible {
  public let name: String
  public let family: String
  public let path: String

  #if os(OSX)
  public typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Font = UIFont
  #endif

  public func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  public func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

public extension FashionFontConvertible.Font {
  convenience init?(font: FashionFontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
// swiftlint:enable all
// swiftformat:enable all
