---
title: "Minnesota Cannabis Menu Platforms, Product Testing Rules, and Home Grow Genetics"
description: "Research on dispensary menu platforms and their APIs, Minnesota OCM product testing requirements, retail pricing and tax, and genetics selection for a 4-flowering indoor home grow."
date-created: 2026-10-07
type: research-note
in-service-of: services/cannabis-services-section
name: research-on-minnesota-cannabis-menu-data-and-home-grow-genetics
keywords: ["Minnesota", "cannabis", "menu platforms", "API", "testing requirements", "potency", "pricing", "tax", "genetics", "home grow", "cultivars", "seeds"]
tags: [draft]
status: draft-for-iteration
authors: [Claude Haiku]
---

## A. MENU DATA: E-COMMERCE PLATFORMS USED BY MINNESOTA DISPENSARIES

### Overview of Major Platforms

Minnesota's licensed and tribal dispensaries use several menu and e-commerce platforms. As of October 2026, the platforms include Dutchie, Leafly, iHeartJane (Jane), Weedmaps, and BLAZE/Treez. Each has different API availability and terms on automated access.

### Dutchie

**Current Status:** Dutchie is North America's leading cannabis commerce platform, powering POS, e-commerce, payments, and loyalty for thousands of dispensaries [Supergood Dutchie API](https://supergood.ai/docs/dutchie-api).

**Public API:** Yes, but deprecated in 2026. Dutchie Plus exposed a GraphQL API with endpoint `https://plus.dutchie.com/plus/2021-07/graphql` for building custom dispensary storefronts. The API allows querying retailer menus, products, variants, potency, and specials, and supports stateful cart/checkout respecting cannabis compliance, inventory, taxes, and per-state rules. Authentication is per-retailer Bearer API key [Dutchie Plus](https://watertown.ethoscannabis.com/plus).

**Critical Note:** Dutchie announced a 2026 sunset/deprecation of the Plus headless commerce API, meaning access to the GraphQL API will end.

**Embedded Menu:** Dutchie offers menu embedding on dispensary websites without requiring customers to leave for checkout.

**Terms on Automated Access:** Documented API was previously permitted under GraphQL contract; automation deprecation signals restriction on future access.

### Leafly

**Current Status:** Leafly is a major cannabis strain database and dispensary directory serving the U.S. and Canada. It lists 5,000+ strains and aggregates dispensary menus and reviews [Leafly.com](https://www.leafly.com/dispensaries/minnesota/minneapolis).

**Public API:** Yes, but with restrictions. Leafly publishes a documented Menu Integration API (OpenAPI via ReDoc) across V1, V1.1, and V2. The API keeps dispensary menus in near-real-time sync with the system of record by pushing product/item data, variants, inventory, pricing, strain information, and cannabinoid data. Public documentation exists [apis.io Leafly](https://apis.io/providers/leafly/index.md).

**Fields Exposed:** Product name, category, strain, potency (THC/THCA/CBD/CBDA %), variants, inventory, price, and lab/certificate of analysis links.

**Access Requirements:** Actual use requires a paid Leafly for Retailers subscription and a Leafly-issued menu integration key. There is no self-serve public signup; this is a partnership requiring business agreement. A partner-gated Order (Reservations) API lets POS systems receive and manage online orders placed on Leafly [Leafly Flowhub Integration](https://flowhub.com/press-release/leafly-flowhub-partner-deliver-real-time-cannabis-menus-online).

**Embedded Menu:** Menus displayed on Leafly's site; dispensaries may embed reviews and links back to their own ordering systems.

**Terms on Automated Access:** Restricted to authorized Leafly business partners; no unaffiliated automated scraping documented.

### iHeartJane (Jane Technologies)

**Current Status:** Jane is a major e-commerce platform for cannabis, powering online menus, POS, and the Jane Universal Product Catalog for 2,500+ dispensaries and brands [Supergood iHeartJane API](https://supergood.ai/docs/i-heart-jane-api).

**Public API:** Partially public. Jane publishes a Swagger-documented REST API for orders, products, inventory, and customer events, plus a TypeScript Data Model (DM) SDK [Jane Technologies](https://www.selecthub.com/p/dispensary-software/i-heart-jane/).

**API Endpoint:** `api.iheartjane.com` with full Swagger documentation available.

**Fields Exposed:** Orders, products, inventory, customer events, and the Jane Universal Product Catalog.

**Access Requirements:** API and SDK access is not self-serve. A Jane account representative must approve enablement. Partner-issued API keys are handed out after account-rep sign-off; no self-serve credentials or OAuth workflow documented [Supergood iHeartJane API Report](https://supergood.ai/api-report-card/i-heart-jane).

**Terms on Automated Access:** Restricted to approved Jane business partners. No public rate-limit documentation exists.

### Weedmaps

**Current Status:** Weedmaps operates as a consumer-facing cannabis search and discovery platform. It integrates with Treez and BLAZE for dispensary orders and inventory [Weedmaps BLAZE Integration](https://www.blaze.me/blog/software-integrations/weedmaps-blaze-partner-for-online-cannabis-ordering).

**Orders and Menu Integration:** Weedmaps Orders and Menu are now fully powered by Treez's API rails. Dispensaries can track and manage all pickup and delivery orders placed through Weedmaps directly in their SellTreez POS [Treez Weedmaps Integration](https://treez.io/blog/introducing-weedmaps-orders-and-menu-integration).

**BLAZE Integration:** Weedmaps and BLAZE Solutions partner to integrate Weedmaps' product database (340,000+ unique products) with BLAZE's POS and e-commerce menus, reducing manual data entry [BLAZE Weedmaps Global Product Catalog](https://www.blaze.me/blog/news/weedmaps-blaze-solutions-launch-comprehensive-global-cannabis-product-catalog/).

**Public API:** No direct public Weedmaps API is documented for third-party developers. Integration is partner-gated.

### BLAZE and Treez

**Current Status:** BLAZE is a cannabis POS system that offers point-of-sale, inventory, and e-commerce capabilities. Treez is a POS provider powering orders through Weedmaps. Both integrate with the broader ecosystem [BLAZE Help Center](https://help.blaze.me/can/home/why-dutchie).

**Menu Capabilities:** BLAZE supports menu embedding and has "Weedmap Screens" for displaying and managing orders from Weedmaps [BLAZE Weedmap Screens](https://help.blaze.me/can/home/what-is-weedmap-screens).

**Public API:** BLAZE and Treez APIs are primarily partner-gated. Integration requires vendor relationship.

### Minnesota Dispensaries and Their Platforms

**Confirmed Dispensary-Platform Mappings:**

- **Green Goods (multiple Minnesota locations: Bloomington, Moorhead, Eagan, Woodbury, Burnsville, Duluth, Minneapolis):** Listed on Leafly [Green Goods Moorhead Leafly](https://www.leafly.com/dispensary-info/green-goods-moorhead/reviews); platform used for menus not explicitly confirmed in search results, but presence on Leafly indicates Leafly integration.

- **RISE Dispensaries (Baxter, Willmar, Eagan, Duluth):** Listed on Leafly [RISE Dispensaries Baxter Leafly](https://www.leafly.com/dispensary-info/rise-dispensaries-baxter); Leafly appears to be the public-facing menu platform.

- **Waabigwan Mashkiki (White Earth Nation tribal dispensaries, Mahnomen, Moorhead, Saint Cloud, East Grand Forks, Chanhassen pending):** Maintains own website [Waabigwan Mashkiki](https://waabigwan.com/); menu platform integration not documented in search results.

**Implicit Finding:** Most Minnesota adult-use dispensaries are discoverable on Leafly, suggesting Leafly integration is widespread, but individual dispensaries' backend POS and menu management systems (Dutchie, BLAZE, Jane, Treez) are not always publicly disclosed. Dispensary menus are typically aggregated to Leafly for consumer discovery.

---

## B. MINNESOTA PRODUCT TESTING AND LABELING REQUIREMENTS

### Potency Testing and Reporting

Minnesota's Office of Cannabis Management (OCM) requires testing of cannabis flower and products before sale. Testing laboratories must measure cannabinoid content according to the Cannabis Technical Authority (CTA) Version 2.0, approved July 1, 2026 [OCM Cannabis Technical Authority v2.0](https://mn.gov/ocm/assets/OCM_Cannabis_Technical_Authority_v2.0_tcm1202-678506.pdf).

**Required Cannabinoid Tests:**

Potency testing analyzes for delta-9-tetrahydrocannabinol (THC), delta-9-tetrahydrocannabinolic acid (THCA), cannabidiol (CBD), and cannabidiolic acid (CBDA). A representative sample from each batch of dried raw cannabis must be tested [Potency Testing Requirements](https://revisor.mn.gov/rules/4770.3030/).

**Total THC Calculation:**

The testing laboratory must calculate total THC using the formula:

```
Total THC = %THC + (%THCA × 0.877)
```

This accounts for the carboxylic acid precursor (THCA) converting to THC via decarboxylation (heating) [Minnesota Potency Rules](https://revisor.mn.gov/rules/pdf/4770.3030/2025-04-25%2010:19:13+00:00).

**Testing Methodology:**

Triple preparation (three separate analyses) of each batch sample is required, with the reported potency being the mean value of results. The relative standard deviation between tested samples must be 10 percent or less [OCM Technical Authority](https://mn.gov/ocm/businesses/technical-authority.jsp).

### Potency Limits for Adult-Use Products

Minnesota has no potency cap in force on adult-use cannabis flower or concentrate. Two 2026 Senate bills proposed caps: [SF 3591](https://www.revisor.mn.gov/bills/94/2026/0/SF/3591) (15% total THC for flower, 30% for concentrate, 500 mg per topical package; introduced 2026-02-17, referred to Commerce and Consumer Protection, no further action) and [SF 4434](https://www.revisor.mn.gov/bills/94/2026/0/SF/4434) (introduced 2026-03-12, referred to the same committee, no further action). Neither was enacted. A finder therefore treats flower potency as unbounded and ranks on the reported total THC.

### Terpene Testing and Disclosure

**Terpene Testing:** Optional, not mandatory. A manufacturer may request that a testing laboratory analyze a minimum of 0.5 grams of batch sample to determine the terpenoid profile. Terpene analysis is not required for compliance, but results may be provided on the label if tested [Minnesota Terpene Testing](https://revisor.mn.gov/rules/4770.3032/).

**Terpene Disclosure:** A manufacturer may include terpenoid profile information on the label only when a terpene analysis has been performed. The testing laboratory reports results as a percentage and in either milligrams per gram (mg/g) by weight or milligrams per milliliter (mg/mL) by volume [Terpene Labeling Rules](https://law.cornell.edu/regulations/minnesota/Minn-R-4770-0850).

**Implication:** Terpene disclosure is a competitive feature, not a regulatory requirement. Cultivators and dispensaries may highlight terpene profiles as a differentiator, but products without terpene testing are fully compliant.

### Seed-to-Sale Tracking and Metrc

Minnesota's Office of Cannabis Management uses the Metrc system (Marijuana Enforcement Tracking Reporting Compliance) for seed-to-sale tracking. All licensed businesses must connect to Metrc for inventory, sales, and compliance reporting. As of May 26, 2026, Governor Walz signed the 2026 Omnibus Cannabis Bill, merging medical and adult-use supply chains so one facility can serve both [Minnesota Metrc Implementation](https://revisor.mn.gov/bills/94/2026/0/SF/3591/versions/latest/).

### Package Size and Labeling Requirements

**Labeling Mandates (Adult-Use):**

Adult-use cannabis products require child-resistant packaging and labels that include:
- Product name and batch identifier
- QR code or unique identifier linking to certificate of analysis (COA)
- Potency (THC and CBD as total THC and total CBD)
- Serving size and servings per container (if applicable)
- Warnings about intoxication and impairment
- Health warnings (pregnancy, breastfeeding, etc.)

Terpene profiles, strain names, and secondary cannabinoids (CBC, CBN) may be included if tested, but are not mandatory [Packaging and Labeling Rules](https://revisor.mn.gov/rules/4770.0850/).

**Package Size Limits:**

For adult-use cannabis flower sold at retail, the maximum single-package size is 1 ounce (28.35 grams). Concentrates are limited to 5 grams per package. Edible cannabis products are capped at 10 mg THC per serving and 200 mg THC per package ([Minn. Stat. § 342.27](https://www.revisor.mn.gov/statutes/cite/342.27)).

---

## C. MINNESOTA RETAIL PRICING AND TAX (2026)

### Retail Pricing

**Per-Gram Price:** Median price of $13.54 per gram as of late 2025/early 2026 [Minnesota Cannabis Pricing](https://www.hoodieanalytics.com/cannabis_markets/minnesota/flower/best-selling-flower).

**Eighth (3.5 grams):** Approximately $48 before tax; approximately $70 with full tax burden included [Minnesota OCM Market Monitor](https://mn.gov/ocm/data-reports/dashboards/cannabis-market-monitor.jsp).

**Wholesale Market:** Flower wholesale prices surged to over $4,500 per pound in 2025–2026 due to high demand and supply constraints. Prices are expected to decrease as supply increases with more cultivators coming online [Minnesota Growers Ramping Production](https://mprnews.org/story/2026/09/17/legal-cannabis-market-in-minnesota-turns-1-growers-ramp-up-production).

### Tax Structure

**Excise Tax:** 15% cannabis excise tax on gross receipts from retail sales. This rate was raised from 10% (2025) to 15% as of July 1, 2025 [Minnesota Cannabis Tax](https://www.mncpa.org/resources/interest-areas/internal-articles/an-excise-exploration-unpacking-minnesota%27s-cannab/).

**Sales Tax:** Minnesota state general sales tax of 6.875%, plus any applicable local sales taxes (varies by municipality).

**Total Tax Burden:** At minimum 21.875% (15% excise + 6.875% state sales tax), plus local taxes. This pushes the total pre-tax cost to a significant markup for consumers [Minnesota Cannabis Excise Tax](https://www.revenue.state.mn.us/sites/default/files/2023-06/hf0100sf0073-adult-use-cannabis-legalization-6.pdf).

---

## D. GENETICS FOR HOME GROW: SEED SOURCING AND CULTIVAR SELECTION

### Legal Status of Cannabis Seeds in Minnesota

Cannabis seeds may be purchased legally in Minnesota for adults 21 and older. Seeds are subject to the Minnesota Department of Agriculture's oversight under the Minnesota Seed Law and Chapter 342 rules, not solely OCM control. Approximately 75 seed labeling permits have been issued since legalization took effect [Minnesota Department of Agriculture Cannabis Seed Program](https://www.mda.state.mn.us/cannabis-seed).

**Key Point:** Seeds may be sold by any seller, not only OCM-licensed dispensaries, provided sales comply with seed labeling and packaging requirements. No per-person seed purchase limits exist under state law.

### Licensed Minnesota Seed Vendors

**Natural Harvest (Edina)**

Licensed seed labeler and distributor. Partners with established seed breeders: Barney's Farm, Fast Buds, Dutch Passion, Sweet Seeds, Ace Seeds, and Humboldt Seed Co. Offers mail-order availability across Minnesota [Natural Harvest Cannabis Seeds](https://minnesotagrown.com/member/natural-harvest).

**Limited Run Seeds LLC (Spicer)**

Licensed craft cannabis seed breeder specializing in small-batch, high-quality seeds. Focuses on blending classic cultivars with innovative genetics to produce stable strains for Minnesota's climate [Limited Run Seeds](https://minnesotagrown.com/member/limited-run-seeds-llc/).

**Lucky Duck Genetics LLC (Cambridge Area)**

Produces and sells adult-use cannabis seeds for home growers. Offers online ordering and local delivery near Cambridge, Minnesota.

**Strains of the Earth (Jordan)**

Began selling cannabis seeds August 1, 2025 [Cannabis Seeds Growing in Minnesota](https://kstp.com/?p=2982002).

### Cannabis Clones

**Availability:** No retail network for cannabis clones in Minnesota was identified. Licensed cultivators obtain plant materials from authorized sources, but retail clone sales are not widely advertised or available through dispensaries as of October 2026.

**Workaround:** Clones may be acquired through personal cultivator relationships or within gifting limits (2 ounces of fresh plant material, if applicable). Medical cannabis patients may have access to clones through cultivators under medical regulations, but adult-use clone sales are not documented.

### Hop Latent Viroid (HLVd) Risk and Clone Testing

**HLVd Overview:** Hop latent viroid is a single-stranded, circular infectious RNA that infects cannabis plants. While HLVd does not kill the plant, it causes significant yield reduction and quality loss [Medicinal Genomics HLVd](https://medicinalgenomics.com/hop-latent-viroid-in-cannabis).

**Yield Impact:** Infected plants show 30–50% reduction in dry weight yield and THC content compared to uninfected plants. Symptoms in vegetative stage include shorter growth and smaller leaves; in flowering, infected plants produce smaller, looser buds with fewer trichomes [HLVd Sampling and Testing Guide](https://cannabisbusinesstimes.com/news/hop-latent-viroid-hlvd-guide-to-sampling-testing-lab-selection-to-prevent-virus-spread).

**Spread Mechanism:** HLVd spreads via cloning (cuttings from infected mother plants) and contaminated tools/equipment. Because symptoms are subtle in vegetative stage, infected mother plants are difficult to identify without diagnostic testing [Medicinal Genomics HLVd Checklist](https://help.medicinalgenomics.com/hubfs/Marketing%20Materials/HLVd%20Checklist.pdf).

**Prevention:** Always sterilize tools before moving between plants. If cloning, source clones from HLVd-tested mother plants. Commercial testing labs offer HLVd screening via RT-qPCR. Minnesota does not mandate HLVd testing for clones or cultivators, but home growers acquiring clones should request testing or source from certified HLVd-negative stock.

### Cultivar Selection for a 4x4 Indoor Grow (4 Flowering Plants)

**Target Environment:** 4×4 foot grow tent with 600–1000 W equivalent LED lighting, good ventilation, temperature control (65–78 °F during flowering), and humidity management (40–50% RH during flowering to prevent bud rot and powdery mildew).

**Key Selection Criteria:**

1. **Flowering Time:** Select strains with 6–9 week flowering cycles for faster harvest and better compatibility with limited space. Sativa-dominant strains with 12+ week flowering times are less suitable for a 4×4 with only 4 plants, as they stretch tall and require more veg time.

2. **Plant Height and Stretch:** Compact strains (60–120 cm or 24–48 inches) are ideal. Low-stretch indicas and indica-hybrid strains are easier to manage in a 4×4 tent than tall sativas. Training (topping, LST, scrogging) can control height, but compact genetics make training easier.

3. **Mold and Powdery Mildew Resistance:** Minnesota's humidity and cold climate favor dense buds prone to botrytis (bud rot) and powdery mildew. Select strains with naturally airy bud structure, good airflow tolerance, and genetics from breeders emphasizing disease resistance. Seed banks note difficulty ratings and pest/mold resistance in strain descriptions.

4. **Yield and Cannabinoid Production:** In a 4×4, growers typically achieve 0.5–1.5 grams per watt (300–1,500 grams or 10.5–53 oz total) depending on strain, experience, and conditions. Higher-yielding strains maximize use of limited flowering space.

5. **Terpene and Chemotype Stability:** Select cultivars with proven terpene consistency across phenotypes. If growing clones of the same mother, chemotype (THC:CBD ratio, dominant terpenes) will be identical. If growing from seed, select female-only (feminized) seed to avoid males and ensure consistent potency.

**Beginner-Friendly Strains for 4x4 Indoor:**

- **Northern Lights:** Fast flowering (7–9 weeks), compact (30–50 inches), high yield (~15 oz/m²), naturally mold-resistant, easy to grow, indica-dominant relaxing effects
- **Blue Dream:** Moderate flowering (8–10 weeks), medium height, moderate yield, hybrid (sativa/indica), balanced effects, reasonably mold-tolerant
- **Green Crack:** Fast flowering (7–8 weeks), medium height, moderate yield, sativa-dominant, good for yielding in space constraints
- **Zkittlez:** Short flowering (7 weeks), compact, moderate yield, sweet terpenes (limonene, caryophyllene, linalool), relatively stable in phenos

**Alternative Consideration:** AutoFlower (Autoflowering) strains provide a 10–12 week seed-to-harvest cycle without manual light switching. However, autoflowers yield less than photoperiod strains in the same space. For maximum control and yield in a 4×4, photoperiod feminized strains are preferred.

### Cannabis Chemotype, Terpene Inheritance, and Phenotype Hunting

**Chemotypes and THC:CBD Ratios:**

Cannabis plants are classified by three chemotypes based on THC and CBD ratios:

- **Type I (High THC / Low CBD):** Typical recreational cannabis, high intoxication potential, minimal therapeutic CBD
- **Type II (High THC + High CBD):** Mixed chemotype, balanced effects, therapeutic + psychoactive
- **Type III (Low THC / High CBD):** Hemp or medical cannabis, minimal intoxication, strong therapeutic effects

[Genetics and Marker-Assisted Selection of Cannabis](https://www.votehemp.com/PDF/Genetics_and_marker-assisted_selection_of_the_chemotype_in_Cannabis_sativa_2005.pdf)

**Inheritance Patterns:**

When a pure Type I (high THC) plant is crossed with a pure Type III (high CBD) plant:

- **F1 generation:** All offspring are Type II (high THC + high CBD), heterozygous for the cannabinoid synthase genes
- **F2 generation:** Offspring segregate into all three chemotypes in a 1:2:1 ratio (25% Type I, 50% Type II, 25% Type III)

This Mendelian inheritance pattern shows that cannabinoid chemotype is genetically controlled by enzymes (THC synthase and CBD synthase) that determine which cannabinoid pathway is expressed [Influence of Genetics on Cannabinoid and Terpene Profiles](https://www.floraflex.com/blogs/floraflex-media/the-influence-of-genetics-on-cannabinoid-and-terpene-profiles-in-cannabis).

**Terpene Profiles:**

Terpenes (limonene, myrcene, caryophyllene, humulene, pinene, linalool, etc.) are genetically determined secondary metabolites. Different cultivars have consistent terpene profiles due to selective breeding. Terpene expression is also influenced by:

- Environmental factors (temperature, light, humidity)
- Nutrient availability (sulfur, nitrogen)
- Harvest timing (early = different profile than peak/late)

Within a single cultivar, all clones of the same mother plant have identical terpene profiles. Seeds from the same cultivar show terpene variation (phenotypic variation) across individual plants.

[Science of Cannabis Genetics: Genotype, Phenotype, Chemotype](https://www.floraflex.com/blogs/floraflex-media/the-science-of-cannabis-genetics-understanding-genotype-phenotype-and-chemotype)

**Phenotype Hunting with ≤8 Plants:**

A home grower with 8 plants total (4 flowering, 4 vegetative) can:

1. **Grow 4 seeds from the same cultivar** (e.g., "Zkittlez" feminized from a reputable breeder)
2. **Flower all 4** and evaluate cannabinoid potency, terpene aroma/flavor, yield, and effect
3. **Take cuttings (clones) from the highest-scoring plant** and keep as a mother
4. **Grow out the mother's clones** in subsequent cycles to confirm stability and consistency

This is phenotype hunting—selecting the best-performing individual (pheno) from a seed batch and perpetuating its genetics via cloning.

**Marker-Assisted Selection (MAS):**

Breeders use genetic testing (DNA sequencing, SNP markers) to identify desired cannabinoid and terpene traits in seedlings before flowering. For a home grower, MAS is impractical, but reputable seed breeders (e.g., Natural Harvest's partners) already perform MAS to ensure consistent cultivars. A grower buying feminized seeds from an established breeder receives stable phenotypes with predictable potency and terpenes.

---

## E. PRACTICAL CULTIVAR STRATEGY FOR THE 8-PLANT GROW

### Cultivation Plan

**Plant Configuration:**
- 4 plants in flowering rotation (the regulatory maximum)
- 4 plants in vegetative/mother plant rotation (backfill)
- Total: 8 plants at any time (at the legal limit)

**Cultivar Approach:**
1. Select a stable, proven feminized cultivar from a Minnesota or national seed bank (e.g., Zkittlez, Northern Lights, or a custom regional strain from Limited Run Seeds)
2. Germinate 4–5 seeds to ensure 4 females for flowering
3. Veg all 4 plants for 4–6 weeks under 18/6 light
4. Flip to 12/12 flowering; expect 7–9 week cycle
5. During flowering, propagate clones from the best vegetative plants or from the flowering mothers (late-stage cutting)
6. Root clones in propagation; transplant to veg area upon rooting
7. Next cycle: Flower the rooted clones (identical genetics) and evaluate year-over-year quality

**Why This Matters for Chemotype:**

If the grower maintains clones of a single proven mother, the THC:CBD ratio and terpene profile remain constant across all cycles. No phenotype variation occurs. If instead the grower rotates new seeds each cycle, potency and flavor will vary plant-to-plant, which may be undesirable for consistent harvests and personal medical preferences.

**HLVd Mitigation:**

- Source seeds from Natural Harvest or other licensed Minnesota seed vendors (seeds have lower HLVd risk than clones)
- If acquiring clones, request HLVd test results from the source cultivator
- Sterilize pruning scissors, scissors, and tools between plants
- Do not share vegetative material with other growers

### Optimal Genetics for MN Climate and Indoor 4x4

**Recommendation: Limited Run Seeds Custom Cultivar + Northern Lights Photoperiod**

1. **Limited Run Seeds (Minnesota-based):** Specializes in cultivars adapted to Minnesota's cold, humid climate. A custom blend of classic + innovative genetics may offer natural mold resistance and stability.

2. **Northern Lights (Backup/Proven):** If custom cultivars are unavailable, Northern Lights is a low-risk, high-reward choice:
   - 7–9 week flowering (compatible with 4× rotation)
   - 30–50 inches height (fits 4×4 tent with standard headroom)
   - ~15 oz/m² yield (good for space efficiency)
   - Naturally compact, mold-resistant
   - Widely available from reputable breeders (Barney's Farm via Natural Harvest)

---

## Sources

- [Dutchie Plus GraphQL API Documentation](https://watertown.ethoscannabis.com/plus)
- [Supergood Dutchie API](https://supergood.ai/docs/dutchie-api)
- [Leafly.com Dispensaries Minnesota](https://www.leafly.com/dispensaries/minnesota/minneapolis)
- [apis.io Leafly API](https://apis.io/providers/leafly/index.md)
- [Leafly Flowhub Menu Integration](https://flowhub.com/press-release/leafly-flowhub-partner-deliver-real-time-cannabis-menus-online)
- [Supergood iHeartJane API](https://supergood.ai/docs/i-heart-jane-api)
- [iHeartJane API Report Card](https://supergood.ai/api-report-card/i-heart-jane)
- [Treez Weedmaps Integration](https://treez.io/blog/introducing-weedmaps-orders-and-menu-integration)
- [BLAZE Weedmaps Global Catalog](https://www.blaze.me/blog/news/weedmaps-blaze-solutions-launch-comprehensive-global-cannabis-product-catalog/)
- [BLAZE Help Center](https://help.blaze.me/can/home/why-dutchie)
- [Green Goods Moorhead Leafly](https://www.leafly.com/dispensary-info/green-goods-moorhead/reviews)
- [RISE Dispensaries Baxter Leafly](https://www.leafly.com/dispensary-info/rise-dispensaries-baxter)
- [Waabigwan Mashkiki](https://waabigwan.com/)
- [OCM Cannabis Technical Authority v2.0](https://mn.gov/ocm/assets/OCM_Cannabis_Technical_Authority_v2.0_tcm1202-678506.pdf)
- [Minnesota Potency Testing Rules (4770.3030)](https://revisor.mn.gov/rules/4770.3030/)
- [Minnesota Terpene Testing Rules (4770.3032)](https://revisor.mn.gov/rules/4770.3032/)
- [Minnesota Packaging and Labeling Rules (4770.0850)](https://law.cornell.edu/regulations/minnesota/Minn-R-4770-0850)
- [Minnesota Cannabis Flower Potency Limits (2026)](https://revisor.mn.gov/bills/94/2026/0/SF/4434/versions/0/)
- [Minnesota Metrc Implementation (2026 Omnibus Bill)](https://revisor.mn.gov/bills/94/2026/0/SF/3591/versions/latest/)
- [Minnesota Package Limits Waabigwan](https://waabigwan.com/minnesota-cannabis-possession-limits)
- [Minnesota Cannabis Pricing Hoodie Analytics](https://www.hoodieanalytics.com/cannabis_markets/minnesota/flower/best-selling-flower)
- [OCM Cannabis Market Monitor](https://mn.gov/ocm/data-reports/dashboards/cannabis-market-monitor.jsp)
- [Minnesota Growers Ramping Production (2026)](https://mprnews.org/story/2026/09/17/legal-cannabis-market-in-minnesota-turns-1-growers-ramp-up-production)
- [Minnesota Cannabis Excise Tax](https://www.mncpa.org/resources/interest-areas/internal-articles/an-excise-exploration-unpacking-minnesota%27s-cannab/)
- [Minnesota Cannabis Tax Legislation](https://www.revenue.state.mn.us/sites/default/files/2023-06/hf0100sf0073-adult-use-cannabis-legalization-6.pdf)
- [Minnesota Department of Agriculture Cannabis Seed Program](https://www.mda.state.mn.us/cannabis-seed)
- [Natural Harvest Cannabis Seeds](https://minnesotagrown.com/member/natural-harvest)
- [Limited Run Seeds](https://minnesotagrown.com/member/limited-run-seeds-llc/)
- [Cannabis Seeds Growing in Minnesota (KSTP)](https://kstp.com/?p=2982002)
- [Medicinal Genomics HLVd Guide](https://medicinalgenomics.com/hop-latent-viroid-in-cannabis)
- [HLVd Sampling and Testing Guide](https://cannabisbusinesstimes.com/news/hop-latent-viroid-hlvd-guide-to-sampling-testing-lab-selection-to-prevent-virus-spread)
- [Medicinal Genomics HLVd Checklist](https://help.medicinalgenomics.com/hubfs/Marketing%20Materials/HLVd%20Checklist.pdf)
- [Genetics and Marker-Assisted Selection of Cannabis](https://www.votehemp.com/PDF/Genetics_and_marker-assisted_selection_of_the_chemotype_in_Cannabis_sativa_2005.pdf)
- [Influence of Genetics on Cannabinoid and Terpene Profiles](https://www.floraflex.com/blogs/floraflex-media/the-influence-of-genetics-on-cannabinoid-and-terpene-profiles-in-cannabis)
- [Science of Cannabis Genetics: Genotype, Phenotype, Chemotype](https://www.floraflex.com/blogs/floraflex-media/the-science-of-cannabis-genetics-understanding-genotype-phenotype-and-chemotype)
