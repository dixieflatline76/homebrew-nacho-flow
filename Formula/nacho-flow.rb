class NachoFlow < Formula
  desc "High-performance OpenAI-compatible hybrid AI gateway for local GPUs and cloud APIs"
  homepage "https://spicebox.dev/nacho-flow/"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-darwin-arm64"
      sha256 "4617121f2c7a0a21f1b93ccc69bbc9ed75d232b2f0d5272b3bd95d29a30058e8"
    end
    on_intel do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-darwin-amd64"
      sha256 "71e7b203cc32fbefef4cd987bfc43ab0ea56d257bff20026d08bd5b53a4d0166"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-linux-amd64"
      sha256 "fbcca16715698dc8256db5ad43b87d4fc5e312d0c047c107621b2481646bc0d4"
    end
    on_arm do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-linux-arm64"
      sha256 "de51fa63c481ace97bf56717ca57296525f4f47d4013e4ec5fab1e8cd8a8e28b"
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
