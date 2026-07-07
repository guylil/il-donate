# IlDonate

Rails 8.1.3 app — Jgive campaign donation page replica (donor-facing, pre-payment).

## Tech

- Ruby 3.4.9, Rails 8.1.3, SQLite3 (ruby docs: https://docs.ruby-lang.org/en/4.0/, rails docs: https://guides.rubyonrails.org/index.html)
- Hotwire (Turbo + Stimulus), Importmap, Propshaft
- No auth, no admin, no API

## Models

**Campaign**
- title, description, organization_name, goal_amount (integer, agorot), amount_raised (integer, agorot, default 0), slug, status
- has_one_attached :cover_image
- `progress_percentage` computed method

**Donation**
- campaign_id (FK), amount (integer, agorot), currency, recurring (boolean), recurring_months (integer)
- donor_first_name, donor_last_name, donor_email, donor_phone
- display_preference (enum: full_name / first_name_only / anonymous)
- dedication (text), status (string — pending/completed/failed)

## Routes

```
resources :campaigns, only: [:show]
resources :donations, only: [:create]
root to: "campaigns#show", id: 1
```

## Tabs (Campaign show page)

| Tab | Content |
|---|---|
| Story | description |
| Donors | recent donations |
| About | organization info |

## Views

- `campaigns/show` — campaign header (cover, title, org, progress bar), tab navigation, tab content via partials
- `donations/_form` — amount step (presets + custom + recurring toggle), details step (name, email, phone, display pref, dedication), submit

## Commands

- Dev server: `bin/dev`
- Console: `bin/rails console`
- Migrate: `bin/rails db:migrate`
- Seed: `bin/rails db:seed`
- Test: `bin/rails test`
- Lint: `bin/rubocop`
