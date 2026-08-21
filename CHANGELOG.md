# Changelog

All notable changes to Vertigo are documented in this file.

The project follows [Semantic Versioning](https://semver.org/).

## [0.1.2] - 2026-08-21

### Fixed

- Replaced the destructive legacy self-update flow with a main-only staged update that validates required shell entry points before replacing the installation.
- Added basic rollback protection so the previous working copy is restored if the replacement step fails.
- Preserved an existing local `config/` directory during a successful update.

## [0.1.1] - 2026-08-20

### Changed

- Added a repository-level README describing the historical Raspberry Pi provisioning architecture and current maintenance status.
- Documented safe manual update, revision pinning, and rollback procedures.
- Clarified that the legacy self-update script is not enabled as an unattended update path until validation and rollback support are added.
- Established release/versioning guidance for future maintained releases.
