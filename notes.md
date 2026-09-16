added:
lh3.googleusercontent.com

to allow_list

then the README instructions:

1. Clone this repository.
2. Run `npm install` to install dependencies.
3. Copy `.env.example` to `.env` and fill in the values.
4. If you haven't downloaded any filters yourself, run the `node download_lists.js` command to download recommended filter lists (OISD Small and AdAway; about 50 000 domains).
5. Run `node cf_list_create.js` to create the lists in Cloudflare Gateway. This will take a while.
6. Run `node cf_gateway_rule_create.js` to create the firewall rule in Cloudflare Gateway.
7. Profit! Time is money after all. You can update the lists by repeating steps 4, 5 and 6.

