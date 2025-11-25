#
#  Copyright 2023 Fred Dushin <fred@dushin.net>
#
#  SPDX-License-Identifier: Apache-2.0 OR LGPL-2.1-or-later
#

class Atomvm < Formula
  desc "An Erlang VM for tiny systems"
  homepage "https://atomvm.org"
  url "https://github.com/atomvm/AtomVM/archive/refs/tags/v0.6.6.tar.gz"
  sha256 "2a7de9b0ec201d992847d6ebbb444708ac07f210c9fa650d7f677c8ec20df074"
  license "Apache License 2.0"
  version "v0.6.6"

  depends_on "cmake" => :build
  depends_on "gperf" => :build
  depends_on "erlang@27" => :build
  depends_on "elixir" => :build
  depends_on "zlib"
  depends_on "mbedtls@3"

  def install
    system "cmake", "-S", ".", "-B", "build", "-D", "AVM_BUILD_RUNTIME_ONLY=on", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test atomvm`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
