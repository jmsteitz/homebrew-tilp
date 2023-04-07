class Tilibs < Formula
  desc "Libraries of the TILP framework to transfer data between Texas Instruments graphing calculators and a computer."
  homepage "https://github.com/debrouxl/tilibs"
  url "https://github.com/debrouxl/tilibs/archive/edf04b7dab4b4ad63c7cb980fa9ad1097118c9f3.zip"
  sha256 "9a6b8084bdf67dc6ea9165dc2fdb74c75b26e1e0ecf3c3a86ad939ad6c8c07d1"
  license "GPL-2.0-or-later"
  version "edf04b7"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "bison" => :build
  depends_on "flex" => :build
  depends_on "texinfo" => :build
  depends_on "intltool" => :build
  depends_on "glib"
  depends_on "lzlib"
  depends_on "gettext"
  depends_on "libusb"
  depends_on "libarchive"

  def install
    ENV["PKG_CONFIG_PATH"] = "#{ENV['PKG_CONFIG_PATH']}:#{prefix}/lib/pkgconfig"
    cd "libticonv/trunk/" do
      # system "echo", ENV["PKG_CONFIG_PATH"]
      system "autoreconf", "-i", "-v", "-f"
      system "./configure", "--disable-dependency-tracking",
                            "--disable-silent-rules",
                            "--prefix=#{prefix}"
      system "make", "install"
    end
    cd "libtifiles/trunk/" do
      system "autoreconf", "-i", "-v", "-f"
      system "./configure", "--disable-dependency-tracking",
                            "--disable-silent-rules",
                            "--prefix=#{prefix}"
      system "make", "install"
    end
    cd "libticables/trunk/" do
      system "autoreconf", "-i", "-v", "-f"
      system "./configure", "--disable-dependency-tracking",
                            "--disable-silent-rules",
                            "--prefix=#{prefix}",
                            "--enable-logging",
                            "--enable-libusb10"
      system "make", "install"
    end
    cd "libticalcs/trunk/" do
      system "autoreconf", "-i", "-v", "-f"
      system "./configure", "--disable-dependency-tracking",
                            "--disable-silent-rules",
                            "--prefix=#{prefix}"
      system "make", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test tilibs`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
