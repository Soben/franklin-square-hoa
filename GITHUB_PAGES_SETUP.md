# GitHub Pages Setup Instructions

The repository has been successfully converted to support GitHub Pages with Jekyll and the Just the Docs theme. Follow these steps to enable the site.

## Step 1: Push Changes to GitHub

First, push the committed changes to your GitHub repository:

```bash
git push origin website
```

## Step 2: Merge to Main Branch

Since GitHub Pages typically deploys from the `main` branch, you'll need to merge these changes:

1. Create a pull request from `website` to `main` on GitHub, OR
2. Merge locally:
   ```bash
   git checkout main
   git merge website
   git push origin main
   ```

## Step 3: Enable GitHub Pages

1. Go to your repository on GitHub: https://github.com/Soben/franklin-square-hoa
2. Click on **Settings** (in the top menu)
3. In the left sidebar, click **Pages**
4. Under "Build and deployment":
   - **Source**: Select "Deploy from a branch"
   - **Branch**: Select `main` and `/ (root)`
   - Click **Save**

## Step 4: Wait for Deployment

GitHub will automatically build and deploy your site. This usually takes 2-5 minutes.

- You'll see a message at the top of the Pages settings indicating the deployment status
- Once complete, your site will be live at: **https://soben.github.io/franklin-square-hoa/**

## Step 5: Verify the Site

Visit your site URL and verify:
- ✅ Home page displays correctly with welcome message
- ✅ Sidebar navigation shows all sections (Declaration, Bylaws, Articles, Amendments, Rules)
- ✅ Search bar appears at the top
- ✅ All documents are accessible and render correctly
- ✅ Search functionality works across documents

## Optional: Custom Domain

If you want to use a custom domain (e.g., docs.franklinsquarehoa.com):

1. In the GitHub Pages settings, enter your custom domain in the "Custom domain" field
2. Configure your DNS provider to point to GitHub Pages
3. Enable "Enforce HTTPS" once DNS propagates

## Troubleshooting

### Site Not Building
- Check the **Actions** tab in your GitHub repository for build errors
- Ensure the `remote_theme` in `_config.yml` is correct
- Verify all front matter YAML is properly formatted

### 404 Errors
- Confirm GitHub Pages is enabled from the correct branch and folder
- Wait a few minutes - initial deployment can take time
- Check that `baseurl` in `_config.yml` matches your repository name

### Search Not Working
- Search is built during the Jekyll build process
- Verify the site has fully deployed
- Check browser console for JavaScript errors

## Local Testing (Optional)

To test the site locally before deploying:

```bash
# Install dependencies
bundle install

# Run Jekyll server
bundle exec jekyll serve

# Visit http://localhost:4000/franklin-square-hoa/
```

## Making Future Updates

To add new documents or amendments:

1. Create a new markdown file in the appropriate directory
2. Add YAML front matter at the top:
   ```yaml
   ---
   layout: default
   title: Document Title
   parent: Parent Section Name
   nav_order: X
   ---
   ```
3. Write your content below the front matter
4. Commit and push to trigger automatic redeployment

## Files Overview

### Configuration Files
- `_config.yml` - Jekyll configuration and theme settings
- `Gemfile` - Ruby dependencies
- `.gitignore` - Excludes build artifacts from git

### Content Files
- `index.md` - Home page
- `declaration.md`, `bylaws.md`, `articles-of-incorporation.md` - Main documents
- `amendments/index.md` - Amendments overview
- `amendments/*.md` - Individual amendment documents
- `rules-and-regulations/index.md` - Rules overview
- `rules-and-regulations/*.md` - Individual rules documents

### Excluded Files
- `README.md` - Still displays on GitHub repository view, excluded from site
- `Agents.md` - AI agent instructions, excluded from site

## Important Notes

- **Legal Document Integrity**: Only YAML front matter was added to existing documents. The legal text remains completely unchanged.
- **Automatic Deployment**: Every push to `main` will trigger a rebuild and deployment
- **Version Control**: All changes are tracked in git history
- **Search Index**: Automatically rebuilt with each deployment

---

For questions or issues, please contact the repository maintainer or open an issue on GitHub.
