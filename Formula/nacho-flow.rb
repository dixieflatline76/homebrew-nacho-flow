class NachoFlow < Formula
  desc "Agent Supervisor & Model Dispatcher for coding agents"
  homepage "https://spicebox.dev/nacho-flow/"
  version "1.4.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-darwin-arm64"
      sha256 "02d19aae246b0a377dde70c8b5eb01d0f693fd4f2d3b8ab6a8ec625e83b6c09c"
    end
    on_intel do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-darwin-amd64"
      sha256 "092cf3412d123353438b757c861c316c77b4a42630713b7b4fa4064cf531eb50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-linux-amd64"
      sha256 "e5de27b1b5e39bff13e39f9edd1c09420b136d7dd4da634bb0732388b13402c1"
    end
    on_arm do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-linux-arm64"
      sha256 "8c91f47f897b2a9af46dc5982f37ec64df447b8b41ca7e234dac251eebcfbc61"
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
