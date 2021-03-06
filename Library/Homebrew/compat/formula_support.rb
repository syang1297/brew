require "formula_support"

class KegOnlyReason
  module Compat
    def valid?
      case @reason
      when :provided_by_osx
        odisabled "keg_only :provided_by_osx", "keg_only :provided_by_macos"
      when :shadowed_by_osx
        odisabled "keg_only :shadowed_by_osx", "keg_only :shadowed_by_macos"
      when :provided_pre_mountain_lion
        odeprecated "keg_only :provided_pre_mountain_lion"
        MacOS.version < :mountain_lion
      when :provided_pre_mavericks
        odeprecated "keg_only :provided_pre_mavericks"
        MacOS.version < :mavericks
      when :provided_pre_el_capitan
        odeprecated "keg_only :provided_pre_el_capitan"
        MacOS.version < :el_capitan
      when :provided_pre_high_sierra
        odeprecated "keg_only :provided_pre_high_sierra"
        MacOS.version < :high_sierra
      when :provided_until_xcode43
        odeprecated "keg_only :provided_until_xcode43"
        MacOS::Xcode.version < "4.3"
      when :provided_until_xcode5
        odeprecated "keg_only :provided_until_xcode5"
        MacOS::Xcode.version < "5.0"
      else
        super
      end
    end

    def to_s
      case @reason
      when :provided_by_osx
        odisabled "keg_only :provided_by_osx", "keg_only :provided_by_macos"
      when :shadowed_by_osx
        odisabled "keg_only :shadowed_by_osx", "keg_only :shadowed_by_macos"
      when :provided_pre_mountain_lion
        odeprecated "keg_only :provided_pre_mountain_lion"

        <<~EOS
          macOS already provides this software in versions before Mountain Lion
        EOS
      when :provided_pre_mavericks
        odeprecated "keg_only :provided_pre_mavericks"

        <<~EOS
          macOS already provides this software in versions before Mavericks
        EOS
      when :provided_pre_el_capitan
        odeprecated "keg_only :provided_pre_el_capitan"

        <<~EOS
          macOS already provides this software in versions before El Capitan
        EOS
      when :provided_pre_high_sierra
        odeprecated "keg_only :provided_pre_high_sierra"

        <<~EOS
          macOS already provides this software in versions before High Sierra
        EOS
      when :provided_until_xcode43
        odeprecated "keg_only :provided_until_xcode43"

        <<~EOS
          Xcode provides this software prior to version 4.3
        EOS
      when :provided_until_xcode5
        odeprecated "keg_only :provided_until_xcode5"

        <<~EOS
          Xcode provides this software prior to version 5
        EOS
      else
        super
      end.to_s.strip
    end
  end

  prepend Compat
end
