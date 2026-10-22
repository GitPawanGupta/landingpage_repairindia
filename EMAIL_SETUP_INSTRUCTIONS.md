# 📧 Email Service Setup Instructions

## 🎯 Dual Email System Setup

Your website now has **TWO email services** with automatic fallback:

1. **EmailJS** (Primary) - Fast & Reliable
2. **FormSubmit** (Backup) - Unlimited & Free

If EmailJS fails, FormSubmit automatically takes over!

---

## 📋 Step 1: EmailJS Setup (Primary Service)

### 1.1 Create EmailJS Account
1. Go to: https://www.emailjs.com/
2. Click **"Sign Up"** (Use Google or Email)
3. Verify your email
4. Login to Dashboard

### 1.2 Add Email Service
1. Dashboard > **"Email Services"**
2. Click **"Add New Service"**
3. Select **"Gmail"** (or your email provider)
4. Connect your **info@repairindia.in** account
5. Copy the **Service ID** (e.g., `service_abc123`)

### 1.3 Create Email Template
1. Dashboard > **"Email Templates"**
2. Click **"Create New Template"**
3. Template Name: `Repair India - Service Request`
4. Template Content:

```html
Subject: New Service Request - {{product}}

Hello Team,

You have received a new service request:

Mobile Number: {{mobile}}
Category: {{category}}
Product: {{product}}
Service Type: {{service_type}}
Brand: {{brand}}
Address: {{address}}
City: {{city}}

Please contact the customer within 5 minutes.

---
Repair India - Automated Email System
```

5. Click **"Save"**
6. Copy the **Template ID** (e.g., `template_xyz789`)

### 1.4 Get Your Public Key
1. Dashboard > **"Account"** (top right)
2. Find **"API Keys"** section
3. Copy **"Public Key"** (e.g., `YOUR_PUBLIC_KEY_12345`)

### 1.5 Update Code
Open `index.html` and replace these 3 values:

```javascript
// Line ~2357
emailjs.init("YOUR_EMAILJS_PUBLIC_KEY");  // Replace with your Public Key

// Line ~2365-2366
emailjs.send(
    'YOUR_SERVICE_ID',      // Replace with Service ID
    'YOUR_TEMPLATE_ID',     // Replace with Template ID
```

**Example:**
```javascript
emailjs.init("xYz123AbC456DeF");
emailjs.send(
    'service_repairindia',
    'template_service_request',
```

---

## 📋 Step 2: FormSubmit Setup (Backup Service)

### 2.1 Activate FormSubmit (One-time)
1. Open your website
2. Fill the form with test data
3. Submit the form
4. Check email: **info@repairindia.in**
5. Subject: **"Activate Form"**
6. Click the activation link
7. ✅ **Done!** FormSubmit is now active

**Note:** This is a ONE-TIME setup. After activation, unlimited emails are free forever!

---

## 🧪 Testing Your Setup

### Test 1: EmailJS (Primary)
1. Open website
2. Fill form and submit
3. Open Browser Console (F12)
4. Look for: `✅ Email sent successfully via EmailJS!`
5. Check `info@repairindia.in` inbox

### Test 2: FormSubmit (Backup)
1. Temporarily break EmailJS (wrong Service ID)
2. Submit form again
3. Console should show: `⚠️ EmailJS failed, trying FormSubmit backup...`
4. Then: `✅ Email sent successfully via FormSubmit (Backup)!`
5. Check inbox - email should arrive

### Test 3: Google Ads Tracking
1. Submit form successfully
2. Console should show: `📧 Email sent via: EmailJS` (or FormSubmit)
3. Google Ads conversion should fire
4. Check Google Ads dashboard after 24-48 hours

---

## 🔍 Troubleshooting

### Issue 1: "emailjs is not defined"
**Problem:** EmailJS library not loaded

**Solution:** Check if this script is in `<head>`:
```html
<script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
```

### Issue 2: EmailJS "Invalid public key"
**Problem:** Wrong Public Key

**Solution:** 
1. Go to EmailJS Dashboard > Account
2. Copy the correct Public Key
3. Update in code: `emailjs.init("CORRECT_KEY_HERE")`

### Issue 3: FormSubmit "Email not verified"
**Problem:** FormSubmit not activated

**Solution:** Check Step 2.1 above - activate FormSubmit

### Issue 4: No emails received
**Problem:** Both services failed

**Solution:**
1. Open Console (F12)
2. Check error messages
3. Verify:
   - Internet connection
   - EmailJS credentials
   - FormSubmit activated
   - Email address `info@repairindia.in` is correct

---

## 📊 Console Messages Guide

| Message | Meaning | Status |
|---------|---------|--------|
| `Attempting to send via EmailJS...` | Trying EmailJS first | ⏳ In Progress |
| `✅ Email sent successfully via EmailJS!` | EmailJS worked! | ✅ Success |
| `⚠️ EmailJS failed, trying FormSubmit backup...` | EmailJS failed, trying backup | ⚠️ Fallback |
| `✅ Email sent successfully via FormSubmit (Backup)!` | FormSubmit worked! | ✅ Success |
| `❌ Both EmailJS and FormSubmit failed!` | Both services failed | ❌ Error |
| `📧 Email sent via: EmailJS` | Final success via EmailJS | ✅ Complete |
| `📧 Email sent via: FormSubmit` | Final success via FormSubmit | ✅ Complete |

---

## 💰 Cost Summary

| Service | Free Tier | Paid Plans | Recommendation |
|---------|-----------|------------|----------------|
| **EmailJS** | 200 emails/month | $7-$55/month | Use for first 200/month |
| **FormSubmit** | ♾️ Unlimited | N/A | Automatic backup |

**Best Practice:**
- EmailJS handles first 200 emails (fast & reliable)
- FormSubmit handles overflow (unlimited & free)
- Both work together automatically!

---

## 🎯 Current Status

- ✅ Dual email system coded and ready
- ⏳ EmailJS credentials need to be added
- ⏳ FormSubmit needs one-time activation
- ✅ Google Ads tracking integrated
- ✅ Fallback mechanism working

---

## 📞 Support

If you need help:
1. Check Console messages (F12)
2. Review troubleshooting section above
3. Test both services individually
4. Contact EmailJS support: https://www.emailjs.com/docs/

---

**Made with ❤️ for Repair India**
Last Updated: 2024
