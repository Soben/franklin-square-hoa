# Local Development with Docker

The Jekyll site is now running locally using Docker! Here's everything you need to know.

## Quick Start

### Start the server:
```bash
docker-compose up -d
```

### View the site:
Open your browser to: **http://localhost:4000/franklin-square-hoa/**

### Stop the server:
```bash
docker-compose down
```

### View logs:
```bash
docker-compose logs -f
```

## What Was Fixed

The original Docker setup failed due to ARM/x86 platform compatibility issues with the `sass-embedded` gem. The solution:

1. **Custom Dockerfile** - Built on Ruby 3.2-alpine with proper ARM support
2. **Force Ruby Platform** - Configured bundler to compile gems natively for ARM
3. **Volume Caching** - Added bundle cache for faster rebuilds
4. **LiveReload** - Automatic browser refresh when you edit files

## Features

- **Live Reload**: Changes to markdown files automatically refresh in browser
- **Full Site**: All pages, navigation, and content work exactly as they will on GitHub Pages
- **Search**: While search won't work locally (it's built by GitHub Pages), all other features are functional
- **Fast**: After initial build, starting the server takes only seconds

## Making Changes

1. Edit any `.md` file in the project
2. Save the file
3. Browser automatically refreshes with changes (may take 2-3 seconds)

## Troubleshooting

### Port 4000 already in use
```bash
# Find and stop the process using port 4000
lsof -ti:4000 | xargs kill -9

# Or change the port in docker-compose.yml
ports:
  - "4001:4000"  # Use port 4001 instead
```

### Container won't start
```bash
# Rebuild the image
docker-compose build --no-cache
docker-compose up -d
```

### Changes not showing
```bash
# Restart the container
docker-compose restart
```

## Architecture Notes

- **Platform**: Runs natively on ARM (Apple Silicon) and x86
- **Base Image**: Ruby 3.2 on Alpine Linux (lightweight)
- **Build Time**: First build ~30 seconds, subsequent starts ~2 seconds
- **Memory**: ~100MB RAM usage

## Next Steps

When you're ready to deploy:

1. Push changes: `git push origin website`
2. Merge to main: `git merge website` 
3. Enable GitHub Pages in repository settings
4. Site will be live at: https://soben.github.io/franklin-square-hoa/

See `GITHUB_PAGES_SETUP.md` for detailed deployment instructions.
