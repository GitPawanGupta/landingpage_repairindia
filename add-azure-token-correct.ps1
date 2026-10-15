# Script to add Azure Static Web Apps deployment token to GitHub Secrets
# For the correct repository

$token = "d6c18fb748ee00f47ce1ec0b982ad534611a314b745fb7f910d42834c1d4cf9603-b4bdb834-60aa-4506-bd45-030b99f7f73c000310705cf40000"
$repoOwner = "GitPawanGupta"
$repoName = "landingpage_repairindia"
$secretName = "AZURE_STATIC_WEB_APPS_API_TOKEN"

Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host "  Azure Static Web Apps - GitHub Secret Setup" -ForegroundColor Cyan
Write-Host "  Repository: $repoOwner/$repoName" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host ""

# Check if GitHub CLI is installed
if (!(Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "GitHub CLI not installed. Using MANUAL METHOD:" -ForegroundColor Yellow
    Write-Host "=============================================" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1. Go to: https://github.com/$repoOwner/$repoName/settings/secrets/actions" -ForegroundColor White
    Write-Host ""
    Write-Host "2. Click 'New repository secret'" -ForegroundColor White
    Write-Host ""
    Write-Host "3. Name: $secretName" -ForegroundColor Green
    Write-Host ""
    Write-Host "4. Value: $token" -ForegroundColor Green
    Write-Host ""
    Write-Host "5. Click 'Add secret'" -ForegroundColor White
    Write-Host ""
    exit 0
}

Write-Host "Setting up GitHub secret..." -ForegroundColor Yellow
Write-Host ""

try {
    # Check authentication status
    Write-Host "Checking GitHub authentication..." -ForegroundColor Yellow
    $authStatus = gh auth status 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Please authenticate with GitHub:" -ForegroundColor Yellow
        Write-Host ""
        gh auth login
        Write-Host ""
    }
    
    # Set the secret
    Write-Host "Adding secret to repository: $repoOwner/$repoName" -ForegroundColor Yellow
    echo $token | gh secret set $secretName --repo="$repoOwner/$repoName"
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "SUCCESS! ✓" -ForegroundColor Green
        Write-Host ""
        Write-Host "The Azure deployment token has been added successfully!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Next steps:" -ForegroundColor Cyan
        Write-Host "1. Push your code to GitHub" -ForegroundColor White
        Write-Host "2. Check GitHub Actions: https://github.com/$repoOwner/$repoName/actions" -ForegroundColor White
        Write-Host "3. Wait 2-3 minutes for deployment" -ForegroundColor White
        Write-Host "4. Check Azure Portal for your live URL" -ForegroundColor White
        Write-Host ""
    } else {
        throw "Failed to set secret"
    }
} catch {
    Write-Host ""
    Write-Host "Could not set automatically. Please add MANUALLY:" -ForegroundColor Yellow
    Write-Host "================================================" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1. Go to: https://github.com/$repoOwner/$repoName/settings/secrets/actions" -ForegroundColor White
    Write-Host ""
    Write-Host "2. Click 'New repository secret'" -ForegroundColor White
    Write-Host ""
    Write-Host "3. Name: $secretName" -ForegroundColor Green
    Write-Host ""
    Write-Host "4. Value: $token" -ForegroundColor Green
    Write-Host ""
    Write-Host "5. Click 'Add secret'" -ForegroundColor White
    Write-Host ""
}
