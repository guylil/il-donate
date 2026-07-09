# Instructions
 - No need to run or compile the project - it is already running
 - When reporting information to me, be extremely concise and sacrifice grammar for the sake of concision   

# IlDonate

Rails 8.1.3 app — Jgive campaign donation page replica (donor-facing, pre-payment).

## Tech

- Ruby 3.4.9, Rails 8.1.3, SQLite3 (ruby docs: https://docs.ruby-lang.org/en/4.0/, rails docs: https://guides.rubyonrails.org/index.html)
- Hotwire (Turbo + Stimulus), Importmap, Propshaft, Tailwind CSS v4 (tailwindcss-rails)
- No auth, no admin, no API

## Models

**Campaign**
- title, description, organization_description, organization_name, goal_amount (integer, agorot), amount_raised (integer, agorot, default 0), slug, status, cover_pic_name
- has_one_attached :cover_image, has_many :donations
- `progress_percentage` computed method, `amount_needed` computed method

**Donation**
- campaign_id (FK), amount (integer, agorot), currency, recurring (boolean), recurring_months (integer)
- donor_first_name, donor_last_name, donor_email, donor_phone
- display_preference (enum: full_name / first_name_only / anonymous)
- dedication (text), status (string — pending/paid/failed/cancel-by-admin)

## Routes

```
resources :campaigns, only: [:show] do
  resources :donations, only: [:index, :create] do
    member do
      patch :approve
      patch :cancel
    end
  end
end
root to: "campaigns#show"
```

## Tabs (Campaign show page)

| Tab | Content | Partial |
|---|---|---|
| Project Info | description | `_story` |
| Recent Donations | recent donations | `_donors` |
| Updates | organization info | `_about` |

## Views

- `campaigns/show` — campaign header (cover, title, org, progress bar), donate button + form, tab navigation, tab content via partials, contact section
- `campaigns/_story` — description body
- `campaigns/_donors` — recent donations list with display preference handling
- `campaigns/_about` — organization info
- `campaigns/_header` / `_cove_img` / `_progress` / `_contact`
- `donations/_form` — amount step (presets + custom + recurring toggle), details step (name, email, phone, display pref, dedication), submit
- `donations/index` — admin approve/cancel UI (pending + paid tables)
- `donations/_paid_row` / `_thank_you`
- `layouts/_top_bar` — header with campaign switcher dropdown
- `layouts/_bottom_bar` — footer

## Controllers

- **CampaignsController#show** — loads campaign by slug or id, defaults to first; handles tab param (story/donors/about)
- **DonationsController#index** — admin list pending + paid donations for a campaign
- **DonationsController#create** — builds donation, converts shekels→agorot (×100), sets pending/ILS, renders Turbo Stream
- **DonationsController#approve** — marks donation paid, increments campaign amount_raised, renders Turbo Stream
- **DonationsController#cancel** — marks donation cancel-by-admin, renders Turbo Stream

## Stimulus Controllers

- **donation_form_controller** — multi-step form: amount presets + custom amount, recurring toggle, step nav, submit button sync
- **campaign_menu_controller** — campaign switcher dropdown toggle + outside-click dismiss

## Commands

- Dev server: `bin/dev`
- Console: `bin/rails console`
- Migrate: `bin/rails db:migrate`
- Seed: `bin/rails db:seed`
- Test: `bin/rails test`
- Lint: `bin/rubocop`
