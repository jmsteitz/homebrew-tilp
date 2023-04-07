class Tilp < Formula
  desc "TILP can transfer data between Texas Instruments graphing calculators and a computer."
  homepage "https://github.com/debrouxl/tilp_and_gfm"
  url "https://github.com/debrouxl/tilp_and_gfm/archive/71eaa92de3962a8602a86275d35489f1aa087d9d.zip"
  version "71eaa92"
  sha256 "f47b131e74ca75c80631cca309228b36d7b9015e8741650a1fd6a3a4eb641f0b"
  license "GPL-2.0-or-later"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "bison" => :build
  depends_on "flex" => :build
  depends_on "texinfo" => :build
  depends_on "intltool" => :build
  depends_on "glib"
  depends_on "gtk+"
  depends_on "libglade"
  depends_on "tilibs"

  def install
    cd "tilp/trunk/" do
      system "autoreconf", "-i", "-v", "-f"
      system "./configure", "--disable-dependency-tracking",
                            "--disable-silent-rules",
                            "--prefix=#{prefix}"
      system "make", "install"
    end
    cd "gfm/trunk/" do
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
    # software. Run the test with `brew test tilp`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
