class NachoFlow < Formula
  desc "High-performance OpenAI-compatible hybrid AI gateway for local GPUs and cloud APIs"
  homepage "https://spicebox.dev/nacho-flow/"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-darwin-arm64"
      sha256 "f2f28cd73a52ebc839754c68ecae1f9b993635bed5eb3e26bd87a4e8b96c97db"
    end
    on_intel do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-darwin-amd64"
      sha256 "63bdd0e4262c22b4ecf251ad6f7df06ea390c29d1b1cb71f73483edd30f42a24"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-linux-amd64"
      sha256 "f86fb0e5b00b651fb0b032c6478935f3ecd8fa90d984dc736985f1eed5ae1810"
    end
    on_arm do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-linux-arm64"
      sha256 "b23766834761c2396debbda93e925892dcfed9a8154bd792caf569df8a7aff15"
    end
  end

  def install
    binary_name = "nacho-flow"
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "nacho-flow-#{version}-darwin-arm64" : "nacho-flow-#{version}-darwin-amd64"
    elsif OS.linux?
      binary_name = Hardware::CPU.arm? ? "nacho-flow-#{version}-linux-arm64" : "nacho-flow-#{version}-linux-amd64"
    end

    bin.install binary_name => "nacho-flow"
  end

  service do
    run [opt_bin/"nacho-flow", "run"]
    keep_alive true
    log_path var/"log/nacho-flow.log"
    error_log_path var/"log/nacho-flow.err.log"
    working_dir var
  end

  test do
    system "#{bin}/nacho-flow", "version"
  end
end
