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


Depending on whether you want to use the **Cloudflare Worker (`serverless-dns`)** or your **Cloudflare Gateway (Zero Trust / Pi-hole)** location, here are the endpoints:

---

### 1. Cloudflare Worker (`serverless-dns`)

| Protocol | Endpoint / URL | Notes |
| :--- | :--- | :--- |
| **DoH** (DNS-over-HTTPS) | `https://dns.adeptsys.uk/dns-query` | Live and tested on your new custom domain (RFC 8484 compliant). Also accessible at `https://serverless-dns.samjbr.workers.dev/dns-query`. |
| **DoT** (DNS-over-TLS) | *Not supported on Workers* | Cloudflare Workers only terminate HTTP/HTTPS (ports 80/443), and cannot terminate raw TCP port 853 required for DoT. |

---

### 2. Cloudflare Zero Trust / Gateway Location (`Managua`)

This is the Gateway resolver where your Pi-hole blocklists and allowlists are synchronized:

| Protocol | Endpoint / Hostname | Notes |
| :--- | :--- | :--- |
| **DoH** (DNS-over-HTTPS) | `https://xf6c35hrxb.cloudflare-gateway.com/dns-query` | Configurable in browsers (Chrome, Firefox), `cloudflared`, or DoH clients. |
| **DoT** (DNS-over-TLS) | `xf6c35hrxb.cloudflare-gateway.com` | Standard TLS on port 853. Supported in Android Private DNS, systemd-resolved, routers, etc. |
| **IPv4 Anycast DNS** | `172.64.36.1`, `172.64.36.2` | Standard UDP/TCP port 53. |
| **IPv6 Anycast DNS** | `2a06:98c1:54::41:2ef3` | Standard UDP/TCP port 53. |

---

### Client Configuration Examples

* **Android (Private DNS / DoT)**:
  Settings → Network & Internet → Private DNS → enter:
  ```text
  xf6c35hrxb.cloudflare-gateway.com
  ```
* **Browser DoH (Firefox / Chrome)**:
  Settings → Privacy & Security → Secure DNS / DNS-over-HTTPS → Custom:
  ```text
  https://dns.adeptsys.uk/dns-query
  ```
  *(or `https://xf6c35hrxb.cloudflare-gateway.com/dns-query` for direct Gateway filtering)*

