# Vertigo

Vertigo is a historical Raspberry Pi provisioning toolkit created by WiFi-ed Networks for setting up a Pi with services such as SSH, Wi-Fi, hotspot mode, splash/display configuration, Samba, Python support, and related boot-time automation.

## Current status

This repository preserves a 2021 implementation. It is **not yet validated against current Raspberry Pi OS releases**. The scripts make privileged, system-wide changes and contain legacy paths such as `/boot` and `/home/pi/Desktop`; review them before running on a production device.

## Architecture

- `start.sh` — orchestration entry point for the provisioning flow.
- `scripts/` — individual setup modules and the legacy self-update script.
- `asset/` and `Reference/` — supporting assets and reference material.
- Windows `.bat` files — helper utilities for Raspberry Pi and FTP workflows.

## Updates

### Automatic update

The repository contains `scripts/self_update.sh` as a legacy device-side self-update mechanism. It is intentionally **not enabled by default**: the current implementation replaces the working copy wholesale and should be validated before unattended use. Automatic updates should only be enabled after a tested Raspberry Pi OS compatibility matrix, release pinning, integrity checks, and rollback support are added.

### Manual update

For a checked-out development or maintenance copy:

```bash
git fetch --tags origin
git status --short
git pull --ff-only origin main
```

To pin a known revision instead of tracking `main`:

```bash
git fetch --tags origin
git checkout <tag-or-commit>
```

If an update must be rolled back, return to the previously known-good tag or commit:

```bash
git checkout <previous-tag-or-commit>
```

Back up device configuration and any local changes before replacing `/boot/vertigo` or other system paths.

## Versioning and releases

Vertigo follows Semantic Versioning when maintained releases are introduced:

- **MAJOR** — incompatible provisioning or platform changes.
- **MINOR** — backward-compatible new capabilities.
- **PATCH** — safe fixes, documentation, or maintenance improvements.

The `CHANGELOG.md` file records repository maintenance changes. Future device releases should be tagged and pinned rather than automatically tracking an arbitrary branch head.

## Safety

Run provisioning scripts only on a test Raspberry Pi first. Review commands that use `sudo`, modify boot configuration, create services, alter network settings, or remove directories. This repository does not currently provide a supported unattended installer for modern Raspberry Pi OS.

## Next maintenance priorities

1. Inventory each script and document its supported Raspberry Pi OS versions.
2. Replace destructive update behavior with release/tag pinning, staging, validation, and rollback.
3. Modernize legacy boot and desktop paths for current Raspberry Pi OS variants.
4. Add a non-destructive test harness or device validation checklist before enabling automatic updates.
