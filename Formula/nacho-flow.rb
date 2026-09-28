class NachoFlow < Formula
  desc "Agent Supervisor & Model Dispatcher for coding agents"
  homepage "https://spicebox.dev/nacho-flow/"
  version "1.4.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-darwin-arm64"
      sha256 "e76aca8a52fe764e5f5b8070f774b151ec359b5536410fbd88aa8569752c411f"
    end
    on_intel do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-darwin-amd64"
      sha256 "0e48358b726bce00a26db013cc4ed56962d9ae0e8b76f24e77761254c7d13f73"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-linux-amd64"
      sha256 "a3f639efc7cf439ba844e6a5794e3d924e20b832e3fc11561880f3548489dd0c"
    end
    on_arm do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-linux-arm64"
      sha256 "32c3f69b29517e3c1c4af8bdbbad18f545f9b7318509cf2c86ce891ce956fc1d"
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
