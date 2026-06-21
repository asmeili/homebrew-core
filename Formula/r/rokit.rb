class Rokit < Formula
  desc "Next-generation toolchain manager for Roblox projects"
  homepage "https://github.com/rojo-rbx/rokit"
  url "https://github.com/rojo-rbx/rokit/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "cc38e267e735c92d9572dfe32f656abcee008da75fd873d8311e927a696fa750"
  license "MIT"
  head "https://github.com/rojo-rbx/rokit.git", branch: "main"

  depends_on "rust" => :build

  uses_from_macos "bzip2"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rokit --version")

    system bin/"rokit", "init"
    assert_path_exists testpath/"rokit.toml"
  end
end
