# Homebrew Tap for Nacho Flow 🌮⚡

Official Homebrew tap for [**Nacho Flow**](https://github.com/dixieflatline76/nacho-flow) — the autonomous multi-tier local/cloud LLM router with real-time pricing oracle and zero-alloc telemetry fan-out.

---

## 📦 Installation

### Quick Install (One-Liner)

```bash
brew install dixieflatline76/nacho-flow/nacho-flow
```

### Or Tap First, Then Install

```bash
brew tap dixieflatline76/nacho-flow
brew install nacho-flow
```

---

## 🚀 Managing Background Service

You can manage `nacho-flow` as a native background service using Homebrew Services:

```bash
# Start nacho-flow in the background and enable auto-start on login
brew services start nacho-flow

# Check service status
brew services list

# Stop the background service
brew services stop nacho-flow

# Restart the service after modifying config.yaml
brew services restart nacho-flow
```

---

## 🛠️ CLI Quick Start

```bash
# Check version & health
nacho-flow version

# Run autonomous auto-tuner
nacho-flow tune

# Initialize default configuration
nacho-flow init
```

---

## 📄 License

[MIT](https://github.com/dixieflatline76/nacho-flow/blob/main/LICENSE) © 2026 Karl Koch & Contributors. Part of the [spicebox.dev](https://spicebox.dev) suite.
