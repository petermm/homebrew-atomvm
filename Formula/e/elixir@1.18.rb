class ElixirAT118 < Formula
    desc "Functional metaprogramming aware language built on Erlang VM"
    homepage "https://elixir-lang.org/"
    url "https://github.com/elixir-lang/elixir/archive/refs/tags/v1.18.4.tar.gz"
    sha256 "8e136c0a92160cdad8daa74560e0e9c6810486bd232fbce1709d40fcc426b5e0"
    license "Apache-2.0"
    head "https://github.com/elixir-lang/elixir.git", branch: "main"
  
    livecheck do
      url :stable
      regex(/^v?(\d+(?:\.\d+)+)$/i)
    end
  
  
    depends_on "erlang@27"
  
    def install
      # Set `Q=` for verbose `make` output
      system "make", "Q=", "PREFIX=#{prefix}", "install"
    end
  
    test do
      assert_match(%r{(compiled with Erlang/OTP \d+)}, shell_output("#{bin}/elixir -v"))
    end
  end