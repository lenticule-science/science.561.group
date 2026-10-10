---
description: Survey of what real literatures say about aliases — gathering across linguistics, database theory, programming languages, operating systems, library science, knowledge representation, logic and formal semantics, mathematics, and sociology, working from internal knowledge to surface what the disciplines agree and disagree on regarding multiple surface forms referring to one entity.
status: draft
session-date: 2026-05-17
topic: aliases
---

# Survey of Aliases in External Literatures

## Scope

This survey gathers what real literatures say about **aliases** — the broad phenomenon of multiple surface forms referring to one underlying entity. The phenomenon shows up under many names: aliases, links, renaming, co-reference, alpha-equivalence, preferred-form-and-variants, `sameAs`, isomorphism-up-to. Each literature has its own vocabulary and its own depth of formalization; this survey gathers each on its own terms.

The motivation for the survey is the open question [`what-are-aliases`](../../questions/what-are-aliases.md). The substrate carries `aliases:` as a frontmatter field on concept, structure, and transformer records, but has not authored what an alias *is*. Per the surveying discipline, the gather here is goal-neutral: it represents what each literature says. Downstream lift work (the alias concept / structure / spec / claim) reads this survey and selects from it; selection in the survey itself would corrupt the gather.

Reading discipline for this session: internal knowledge only. No web fetches, no archival reads. The survey is a knowledge-survey of what is well-attested in each literature's standard texts; downstream lift work can fill in citations from primary sources.

## §1 — Linguistic and philosophical foundations

### 1.1 Frege: sense and reference (1892)

Gottlob Frege's *Über Sinn und Bedeutung* (1892) introduces the distinction that grounds most subsequent treatment of co-reference. The morning star and the evening star *refer* to the same object (Venus) but have different *senses* — different modes of presentation. The proper name "Hesperus" and the proper name "Phosphorus" co-refer; the identity statement "Hesperus is Phosphorus" is informative precisely because the senses differ even though the references coincide.

For the alias question: Frege's distinction means that "two surface forms refer to the same entity" can be true in two structurally different ways. It can be true *trivially* — the surface forms are notational variants with the same sense (e.g., `auditor` and `auditor` in two slots are the same). Or it can be true *informatively* — the surface forms have different senses but coincidental reference (e.g., `morning-star` and `evening-star` both pointing to Venus). The substrate alias discipline implicitly takes the trivial reading; the informative reading is the territory of synonymy and co-reference more broadly.

### 1.2 Russell: definite descriptions (1905)

Bertrand Russell's "On Denoting" (*Mind*, 1905) recasts identity statements as logical claims. "The author of *Waverley* is Scott" is analyzed as: there exists a unique x such that x authored *Waverley*, and that x is Scott. Identity is a relation between *descriptions* picking out the same individual, not a relation between names.

The Russell move pushes against treating aliases as primitive. On Russell's analysis, what looks like two names for one entity is really two descriptions whose extensions coincide; the "alias" relation is derived, not declared. This is structurally closer to the identity-by-relations principle — the entity is what its predications determine, and alternate surface forms are alternate descriptions, not primitive labels.

### 1.3 Kripke: rigid designation (1972)

Saul Kripke's *Naming and Necessity* (1972, published 1980) rejects Russell's descriptivism for proper names. A proper name like "Aristotle" *rigidly designates* the same individual across all possible worlds in which that individual exists. The reference is fixed by a baptismal causal chain, not by a description; Aristotle remains Aristotle even in a world where he never taught Alexander.

Aliases on the Kripkean account are alternate rigid designators for the same individual. The "Hesperus is Phosphorus" identity is necessary (not contingent) but a posteriori (not knowable a priori) — the alias relation holds across all worlds in which both names refer at all.

For the substrate: if aliases are Kripke-rigid, they are necessary identities — once `documents` aliases `document`, the alias holds across all substrate states, not contingently on the current configuration. This is a strong commitment.

### 1.4 Co-reference and anaphora

A separate linguistic tradition addresses how natural language tracks the same entity across sentences. Irene Heim's *The Semantics of Definite and Indefinite Noun Phrases* (1982) and Tanya Reinhart's work on binding theory develop the apparatus: indefinite noun phrases introduce *discourse referents*; subsequent definite or pronominal forms can *anaphorically* refer back to them. "A man walked in. He sat down." The pronoun "he" co-refers with "a man" — an in-discourse alias, contingent on the discourse continuing.

The co-reference apparatus is *dynamic*: discourse referents are introduced and bound, with scoping rules governing what can refer to what. This is structurally very different from substrate aliases (which are static substrate records), but it illustrates that "alias" can be a runtime/contextual relation as well as a static declaration.

## §2 — Database theory

### 2.1 Codd's relational model and the renaming operator (1970)

E. F. Codd's "A Relational Model of Data for Large Shared Data Banks" (*Communications of the ACM*, 1970) establishes the relational model. In subsequent formalization, relational algebra includes a *renaming operator* ρ that produces a new relation differing from its argument only in attribute names. ρ_{a/b}(R) yields a relation identical to R except that attribute b is now called a. Renaming is a primitive operation; the renamed relation is structurally equivalent to the original.

Renaming is the database-theoretic alias: a new surface form (attribute name) for an existing entity (the attribute's role in the relation). The renaming operator is *purely syntactic* — it does not change the relation's content, only its labels. Two attributes related by renaming hold the same data; they are aliases.

### 2.2 SQL aliases

SQL operationalizes renaming through the `AS` keyword. Column aliases (`SELECT name AS person_name FROM users`), table aliases (`FROM users AS u`), and derived table aliases (`FROM (SELECT ...) AS sub`) provide alternate surface forms within a query. The alias is *query-scoped*: it exists for the duration of the query and does not modify the underlying schema.

SQL views generalize this. `CREATE VIEW preferred_form AS SELECT ...` creates a named relation that aliases (in a generalized sense) a query expression. The view is addressable like a table but is computed from underlying tables. Views can be updatable when the alias relation is "clean" — when each row of the view corresponds to exactly one row of an underlying table, with no aggregation or projection ambiguity.

The SQL `WITH` clause (Common Table Expressions, CTEs, introduced in SQL:1999) extends this to local aliases within a query, supporting recursive aliases for tree and graph queries.

For the alias question: SQL distinguishes two kinds of alias — *scoped* (query-local) and *persistent* (view-based). Both are syntactic; both leave the underlying schema unchanged. SQL has no notion of "the same row addressed by multiple primary keys" — primary key identity is sacrosanct.

### 2.3 Relational identity

The deeper database-theoretic question — when are two relations "the same" — has standard answers. Two relations are *equal* iff they have the same attributes (same names, same types, same order in the strict relational algebra) and the same set of tuples. Equality is checkable; the renaming operator is the bridge across name differences. There is no built-in mechanism for "two tables with different schemas representing the same entity"; that representation problem is handled by ETL, data integration, or master data management, not by relational algebra itself.

The discipline: in the relational model, aliases live at the schema-or-query level (attribute names, table names, view names), not at the data level (primary keys). Primary keys are the substrate's identity; schema names are addressing labels.

## §3 — Programming languages

### 3.1 Pointer aliasing

In C, C++, and other languages with first-class pointers, multiple pointer variables can hold the same address — they alias. Writes through one pointer are visible through the other; reads are subject to the most recent write. The aliasing problem for compilers is to determine, given two pointers, whether they might alias — because if they might, the compiler cannot reorder reads and writes through them without risking semantic violation.

Alias analysis is a major static-analysis subfield. *Andersen-style* (1994) and *Steensgaard-style* (1996) analyses give the standard precision/cost trade-offs: Andersen is inclusion-based and more precise; Steensgaard is unification-based and faster. Modern compilers combine these with type-based and shape-based refinements.

For the alias question: pointer aliases are *runtime identities*. Two pointers alias when their values are equal *at a given moment*. The alias relation is dynamic and may change as pointers are reassigned. This is fundamentally different from the static substrate aliases, which are declared and persistent. But the discipline shares one feature: aliases create *non-locality* — a change made through one surface form is visible through another, and the system must reason about both surfaces to predict behavior.

### 3.2 Alpha-equivalence in lambda calculus

Alonzo Church's lambda calculus (1936, formalized in *The Calculi of Lambda Conversion*, 1941) introduces bound variables. In `λx. f(x)`, the variable `x` is bound by the abstraction; the term denotes the same function as `λy. f(y)`. *Alpha-equivalence* is the equivalence relation that identifies terms differing only in bound variable names.

Alpha-equivalence is the formal-systems standard for "bound names don't matter." The variable's surface form is a label for the binding position; alternate labels denote the same function. Alpha-equivalence classes are the *real* terms of the calculus; the labeled surface forms are representations of them.

For aliases: alpha-equivalence is the cleanest mathematical model of "alternate surface forms for the same entity, where the surface form is arbitrary." A substrate that takes the alpha-equivalence framing reads aliases as: the substrate works on alpha-equivalence classes; surface forms are representatives; the choice of representative is arbitrary up to alias.

The catch: alpha-equivalence applies to *bound* names. Free names (constants, globals) are not subject to alpha-equivalence — they have fixed reference. The substrate substrate names are mostly free (a structure named `agent` doesn't have its name bound by an enclosing scope), so direct alpha-equivalence doesn't quite fit. The framing is suggestive but not literally applicable.

### 3.3 De Bruijn indices

Nicolaas Govert de Bruijn's *Lambda Calculus Notation with Nameless Dummies* (1972) gives a name-free representation of lambda terms: instead of variable names, each bound variable is replaced by an integer counting how many lambdas one must walk outward to reach the binder. `λx. λy. x` becomes `λ λ 2`; `λx. λy. y` becomes `λ λ 1`.

De Bruijn's notation eliminates the alias problem at the representation level: there are no variable names to alias because there are no variable names. Terms are represented canonically, alpha-equivalence becomes literal equality.

For aliases: de Bruijn's move suggests a different way to handle the morphological-variation problem — make the substrate's canonical form name-free, with surface forms being human-readable labels generated on demand. This is structurally cleaner than `aliases:` declarations but loses readability; the substrate is mostly read by humans, so the trade-off doesn't obviously favor the de Bruijn move.

### 3.4 Nominal sets (Gabbay-Pitts)

Murdoch Gabbay and Andrew Pitts's "A New Approach to Abstract Syntax with Variable Binding" (*Formal Aspects of Computing*, 2002, anticipated by Gabbay's PhD thesis 1999) introduces *nominal sets* — sets carrying an action of the symmetry group of name swaps. A nominal set's elements are equivariant under name permutations; the formal apparatus makes alpha-equivalence native to the underlying mathematics rather than imposed as a quotient.

The Pitts-Gabbay nominal approach has been deeply influential in the proof-assistant world (Isabelle/HOL's Nominal2 package; Coq's nominal extensions). It gives a clean categorical-logical treatment of name binding: the category of nominal sets is a topos; functors between nominal sets preserve the symmetry action; name swapping is a primitive operation with well-understood algebraic properties.

For aliases: nominal sets are the right mathematical home for "surface forms are arbitrary up to permutation, but the entity carrying them is invariant." If the alias discipline can be lifted to a nominal-set-theoretic claim, the discipline inherits the apparatus's compositional story automatically. This is one of the strongest candidate framings to read the alias question through.

## §4 — Operating systems and addressing

### 4.1 Unix hard and symbolic links

Unix filesystems distinguish two link kinds. A *hard link* is an additional directory entry pointing to the same inode — the file has multiple names, all of which are equal in standing (no notion of "original" vs "alias"). A *symbolic link* (symlink) is a file containing a path to another file; resolving a symlink follows the path. Hard links cannot cross filesystems and cannot point to directories (typically); symlinks can do both but break when the target is moved.

The hard-link / symlink distinction is the OS-level instance of the alias question. Hard links treat all names as equally authoritative; the inode is the entity, and names are just addresses. Symlinks distinguish *the link* (a file in its own right) from *the target* (the file the link points to), with the link's content being the path. Hard links are pure aliases; symlinks are aliases plus indirection.

For the substrate: hard links are the cleaner model. All surface forms for an entity are equally authoritative; there is no "preferred form" sitting above the others. But the slug convention (one entity, one filename) suggests preferred-form thinking — `auditor-of-citations` is *the* slug for that agent; `auditor-of-citation` (singular) is an alias to it, not an equal alternative. The asymmetry is closer to symlink semantics: one canonical name plus pointers.

### 4.2 Shell aliases

Bourne shell, csh, and bash all support shell aliases — user-defined command name substitutions. `alias ll='ls -lh'` makes `ll` an alias for `ls -lh`. The alias is purely syntactic: at command-parse time, `ll` is rewritten to `ls -lh`, and the resulting command runs normally.

Shell aliases are textual substitutions, not bindings to programs. They don't have a "target program" in the way symlinks have a target file; they have a *replacement string* that the shell substitutes at parse time. The alias is invisible after parsing; the program being run doesn't know it was invoked via an alias.

For the substrate: shell aliases are *resolution-time* aliases — the substitution happens at lookup, leaving no trace afterwards. This is closer to the intended discipline than symlinks: a slug containing an aliased token resolves to the canonical record, and the aliased surface form leaves no substrate trace beyond the resolution.

### 4.3 macOS aliases

The classic Mac OS *alias* (Mac OS 7, 1991) was a small file containing both a path and an inode-style identifier; the Alias Manager would resolve an alias by checking the path first and falling back to the identifier if the file had been moved or renamed. This made Mac aliases more robust than Unix symlinks for moved targets, at the cost of additional resolution machinery.

The alias-resilience-to-rename feature isn't directly relevant to the discipline (the substrate edits are tracked in git, not under aliases), but it illustrates a design choice: aliases can either be brittle (Unix symlink semantics: alias breaks if target moves) or robust (Mac alias semantics: alias follows target through moves). Both are defensible; the choice depends on what aliases are *for*.

### 4.4 DNS CNAME records

DNS's CNAME (Canonical Name) record (RFC 1035, 1987) declares one domain name an alias for another. A CNAME lookup follows the chain — `www.example.com` CNAME `example.com` A `93.184.216.34` resolves through the CNAME to the canonical A record. Chains of CNAMEs are permitted but performance-penalized; loops are forbidden.

DNS distinguishes *canonical* (the A or AAAA record) from *alias* (CNAME). The terminology is exact: the CNAME's name is *not* canonical; it's an alias for a canonical name elsewhere. There is one canonical record per IP; all other names that resolve to it are aliases.

For the substrate: DNS gives the cleanest deployed terminology for "canonical-name vs alias." The substrate substrate slug is canonical; the `aliases:` field lists non-canonical surface forms. The terminology matches.

### 4.5 Email aliases

Email aliases (per RFC 5321 and predecessors) allow one mailbox to receive mail addressed to multiple addresses. `aliases` files (`/etc/aliases` in postfix and predecessors) declare the mapping. Aliases can chain (one alias resolves to another); they can fan out (one address aliases to multiple); they can include external addresses.

Email aliases are like DNS CNAMEs but with richer resolution: fan-out to lists, integration with mailing-list software, header rewriting. The administrative complexity is significant, but the underlying notion is the same: alternate surface forms for the same recipient.

## §5 — Library and information science

### 5.1 Authority control

Library cataloging has worked on the alias question for over a century. The discipline is called *authority control*: maintaining records that establish the canonical form of names (personal, corporate, geographic, subject) and link variant forms back to the canonical.

The IFLA (International Federation of Library Associations) maintains the *Functional Requirements for Authority Data* (FRAD, 2009), which models authority records as substrate entities distinct from the bibliographic records they govern. An author has one authority record; multiple bibliographic records can cite the authority; the authority itself can have multiple name forms (the canonical heading plus see-references for variant forms).

### 5.2 Library of Congress Name Authority File

The LC Name Authority File (NAF) is the deployed standard for English-language library cataloging. Each authority record carries:

- The *established heading* — the canonical form, chosen per cataloging rules (RDA, formerly AACR2). The chosen form is typically the form most commonly found, with disambiguation as needed.
- *See references* — variant forms that point to the established heading. "Twain, Mark" is the established heading; "Clemens, Samuel Langhorne" is a see reference. A patron searching either form finds the same author.
- *See-also references* — links to related but distinct authority records. "Twain, Mark" might see-also "Clemens, Samuel Langhorne, 1835-1910" if there's a separate authority for the legal person under that exact form.

The discipline distinguishes *aliases* (see references — same entity, different surface form) from *related entities* (see-also references — different entities, related semantics). The distinction is exact and load-bearing for catalog navigation.

### 5.3 VIAF

The Virtual International Authority File (VIAF) aggregates authority records from over twenty national libraries, clustering records that represent the same entity into VIAF clusters. A VIAF cluster has one canonical identifier (the VIAF ID) and links to the constituent authority records from each contributing library. The clusters are computed by matching algorithms over the source records' name forms, dates, identifiers, and other features.

VIAF makes the alias question explicitly *cross-source*: the same author's authority record in the LC NAF, the BnF (Bibliothèque nationale de France), and the DNB (Deutsche Nationalbibliothek) all alias to one VIAF cluster, even though the source records use different cataloging rules and different name forms (transliteration, language).

For the alias question: library authority control is the most directly analogous practical discipline to the intended use. The terminology distinguishes "canonical form" (the slug), "see references" (the `aliases:`), and "see-also" (related but distinct entities — the cross-references). The disciplines map cleanly.

### 5.4 The Open Researcher and Contributor ID (ORCID)

ORCID (2012—) gives each researcher a persistent identifier independent of name forms. The ORCID iD is a 16-digit number; researchers register their preferred name forms, alternate name forms, name in non-Latin scripts, and historical name forms (maiden names, prior legal names) against the iD.

ORCID makes the identifier-name-distinction explicit: the iD is *not* a name; it's a stable handle. Names are alternate labels for the iD. A researcher who changes name (marriage, gender transition, transliteration update) updates their name record without changing the iD; citations using the old name remain resolvable because they were cited under the iD, not the name string.

The ORCID move is a direct response to the question. By separating identifier from surface form, ORCID renders the alias question moot: surface forms are all aliases for the iD. There is no "canonical name" except by convention.

## §6 — Knowledge representation

### 6.1 owl:sameAs

OWL (Web Ontology Language) supplies `owl:sameAs` as a property declaring two URIs refer to the same individual. `<dbpedia:Mark_Twain> owl:sameAs <viaf:50566653>` declares the DBpedia URI for Mark Twain and the VIAF URI for the same author co-refer. Reasoners infer that any property asserted on one URI holds for the other; the URIs become interchangeable for inference purposes.

`owl:sameAs` is the linked-data community's primary alias mechanism. It scales to the web: URIs from different ontologies, different datasets, different authorities can be linked into co-reference clusters. The discipline is *symmetric* (sameAs is reflexive, symmetric, transitive) and *unconditional* (the assertion holds in all contexts).

### 6.2 The sameAs problem

In practice, `owl:sameAs` is often misused. The "sameAs problem" (Halpin, Hayes et al., 2010, "When owl:sameAs Isn't the Same") documents that real-world `sameAs` assertions are often weaker than the OWL semantics: they mean "closely related," "co-referent in some context," "approximately the same," or "the same for the purposes of this application." Treating them as full identity produces unsound inferences.

Several remedies have been proposed: `skos:closeMatch` and `skos:exactMatch` for the SKOS vocabulary (matched concepts in different schemes, with varying degrees of certainty); `umbel:isLike` for "similar to"; context-dependent identity proposals (Halpin and Presutti, 2011). None has won universal adoption; the practical state is that `owl:sameAs` is used liberally and reasoners cope with the noise.

For the substrate: the sameAs problem is a cautionary tale. Declaring two surface forms "the same" is easy; getting the semantics right under composition (sameAs is transitive — if A sameAs B and B sameAs C, then A sameAs C) is hard. The substrate no-chain rule for aliases is a deliberate response to this risk.

### 6.3 SKOS preferred and alternate labels

SKOS (Simple Knowledge Organization System, W3C 2009) addresses concept-scheme labeling. Each concept may have one `skos:prefLabel` per language and multiple `skos:altLabel`s. The `altLabel`s are synonymous-for-this-concept-in-this-scheme alternate forms. `skos:hiddenLabel` is for terms that should be retrievable but not displayed (deprecated forms, misspellings).

SKOS is structurally close to the intended discipline. One canonical form (`prefLabel` ↔ slug), multiple alternate forms (`altLabel` ↔ `aliases:`). The SKOS discipline allows scheme-level variation: a concept in two SKOS schemes can have different prefLabels in each.

For the substrate: SKOS's three-level (preferred / alternate / hidden) discipline is more nuanced than the substrate has named. The substrate `aliases:` collapses what SKOS would call `altLabel` and (perhaps) `hiddenLabel`. Whether the substrate needs the three-level discipline depends on whether the substrate carries terms-for-retrieval-but-not-display.

### 6.4 Wikidata aliases

Wikidata (2012—) gives each item a Q-identifier (Q42 is Douglas Adams) and labels in many languages. Each label-language pair admits one *label* (the primary form) and many *aliases* (alternate forms searched under, but not displayed as the primary). `Q42`'s English label is "Douglas Adams"; English aliases include "Douglas Noel Adams" and "Douglas Noël Adams".

Wikidata's discipline is operational at massive scale (>100M items, >5000M statements as of 2024). The discipline scales because:

- Aliases are labels, not statements. They don't carry truth conditions; they're for search and display.
- Aliases are per-language. A Russian alias for Q42 doesn't have to relate to its English alias.
- Aliases are explicitly *not* synonyms. Wikidata distinguishes alias (alternate name for the same item) from `said to be the same as` (statement that two items co-refer — used during deduplication).

For the substrate: Wikidata's discipline is structurally similar. Aliases are alternate forms for retrieval; they don't carry substrate content; they're per-context (per-language for Wikidata, possibly per-scope in the substrate).

## §7 — Logic, formal semantics, and category theory

### 7.1 Alpha-equivalence revisited

Already treated in §3.2. The point worth re-stating: alpha-equivalence is the formal-systems framework's answer to "alternate surface forms of the same entity, where the surface form is arbitrary." It's the cleanest model, but applies natively only to bound names. Free names (the substrate slugs are mostly free) require additional discipline.

### 7.2 Isomorphism vs equality

In set theory and most of mathematics, two structures can be *isomorphic* (structurally indistinguishable, related by an invertible structure-preserving map) without being *equal* (literally the same set with the same elements). The natural numbers ℕ defined via Peano axioms and the natural numbers defined via Zermelo sets are isomorphic, not equal.

The distinction matters categorically. *Equality of objects* in a category is a strong notion (often ill-behaved); *isomorphism of objects* is the natural notion. Working up to isomorphism is standard mathematical practice; treating isomorphic objects as "the same" is the standard alias-like move in category theory.

### 7.3 Homotopy Type Theory and identity types

Homotopy Type Theory (HoTT), developed in the late 2000s by Steve Awodey, Vladimir Voevodsky, and others (consolidated in *Homotopy Type Theory: Univalent Foundations of Mathematics*, 2013), reformulates equality. The *identity type* `Id_A(x, y)` is the type of evidence that `x` and `y` are equal as elements of `A`; this type can be nontrivial — there can be multiple distinct paths between two equal elements.

Voevodsky's *univalence axiom* states that the identity type between two types is equivalent to the type of equivalences between them — "isomorphic types are equal." This makes working-up-to-isomorphism formally clean: isomorphic structures are literally identified by the axiom; alpha-equivalence and structure-renaming become path-equality rather than quotient operations.

For the substrate: HoTT is the most mathematically-sophisticated framework for "alternate surface forms of the same entity." The univalence move says aliasing isn't a quotient operation imposed after the fact; it's built into the foundations. Lifting the alias discipline to HoTT would be a strong move but requires significant mathematical commitment.

### 7.4 Quotient types

Quotient types (in type theory, especially Coq, Lean, Agda) represent a type with an explicit equivalence relation: `A / ~` is the type of equivalence classes of `A` under `~`. Operations on quotient types must respect the equivalence; the type checker enforces this.

Quotient types are the most direct formal analog of "alternate surface forms collapsed to equivalence classes." A substrate that takes the quotient-types view reads aliases as: the substrate's entities are equivalence classes; surface forms are representatives; the alias relation is the equivalence.

The catch: quotient types require the equivalence to be specified in advance. The substrate `aliases:` field is more like declaring class membership case-by-case than specifying a uniform equivalence relation. Quotient types would force the substrate to articulate *what* makes two surface forms equivalent (singular/plural? inflection?); the current discipline leaves this open.

## §8 — Sociology, pseudonymity, and personal names

### 8.1 Pen names, stage names, brand DBA

Personal naming practice has many alias-like phenomena. Pen names (Samuel Clemens / Mark Twain) keep an authorial identity separate from a legal identity. Stage names (Norma Jeane Mortenson / Marilyn Monroe) separate a public persona from a birth name. "Doing business as" (DBA) names give a sole proprietor or partnership a trade name distinct from the legal entity name.

Each of these is a deliberate alias maintained for a purpose: privacy, marketing, persona separation. The legal and the persona are co-referent at the level of the individual, but the surface forms are not interchangeable in every context — citing Clemens by his pen name when discussing his *Notebooks* is correct; citing him by his legal name when discussing *Tom Sawyer* is correct; mixing the two is a category error or a deliberate stylistic move.

For the substrate: personal-name aliases are *context-sensitive*. The same individual has multiple aliases; which one is right in a given context depends on the discourse. This is structurally different from substrate aliases (which are uniform), but it warns that aliases are often *not* freely interchangeable — context can fix one form as preferred.

### 8.2 Pseudonymity

David Chaum's "Untraceable Electronic Mail, Return Addresses, and Digital Pseudonyms" (*Communications of the ACM*, 1981) introduces the cryptographic apparatus for pseudonymity — alternate identifiers that cannot be linked to the underlying identity except by the holder. Pseudonyms are aliases-with-deliberate-opacity: the holder knows the linkage, no one else does.

Pseudonymity is the limit case of alias: the alias is robust precisely because the linkage to the canonical identity is hidden. This is the opposite discipline from the substrate's: substrate aliases are *meant* to be resolved publicly, declared in plain frontmatter.

### 8.3 Deadnames and trans naming politics

The contemporary discourse around deadnames — the names trans people used before transition — illustrates that alias semantics is socially and politically loaded. A deadname is technically an alias for the same individual; treating it as a freely-interchangeable alternative form is harmful. The discipline of respecting current names treats prior names as *retired*, not as alternate forms.

For the substrate: this case illustrates that not every co-referent surface form should be admitted as an alias. The substrate discipline that aliases are not compatibility shims for renames-in-flight has a direct analog: a renamed substrate record's old surface form is retired, not aliased.

## §9 — Where the literatures converge

Reading across the literatures, several convergences are real:

- **One canonical form, multiple alternate forms.** Library authority control's see-references, DNS CNAME, SKOS prefLabel/altLabel, Wikidata's label-and-aliases discipline, and Mac OS aliases all distinguish a canonical surface form from alternates. There is no widely-adopted discipline that treats all surface forms as equally authoritative; even Unix hard links, the closest case, are administered with one path designated as the "real" location.

- **Aliases are structural, not semantic.** SKOS distinguishes altLabel (same concept, different surface) from semantic relations (broader, narrower, related). Library see-references are distinguished from see-also references. The `owl:sameAs` problem documents what goes wrong when alias semantics gets mixed with semantic-similarity semantics. The discipline across literatures: aliases denote one entity under multiple labels, not multiple-but-similar entities.

- **Composition (transitivity) is fragile.** `owl:sameAs` is formally transitive but practically problematic; DNS CNAME chains are permitted but performance-penalized; email alias chains can produce loops. The literatures that have run aliases at scale (linked data, DNS, email) all warn that alias chains are a real engineering hazard.

- **Aliases are operational, not constitutive of identity.** Library authority records, ORCID, Wikidata, and DNS all distinguish the entity (authority record, iD, Q-identifier, IP address) from the surface forms (names, labels, addresses). The entity exists independently of any particular surface form; aliases are operational labels for addressing.

- **Context can fix preferred forms.** SKOS allows different prefLabels per language; Wikidata aliases are per-language; personal naming is contextual (pen name in literary context, legal name in legal context). Aliases are not always interchangeable; context can prefer one form over another.

- **Distinct from synonymy.** Across linguistics (Frege), library science (see vs see-also), SKOS (altLabel vs related), Wikidata (aliases vs "said to be the same as"), and the own commitment, aliases and synonyms are kept apart. Synonyms are *semantically* similar but distinct entities; aliases are *one* entity under multiple surface labels.

The literatures diverge on:

- **Whether aliases are predications or quotients.** Library science treats aliases as predications on the authority record (see references are explicitly recorded). Quotient types treat them as derived from an equivalence relation. Nominal sets and HoTT treat them as built into the foundations. No tradition wins; each works at a different level of abstraction.

- **Whether aliases can chain.** DNS allows chains; library authority records typically don't (a see-reference points to a canonical heading, not to another see-reference); Wikidata aliases don't chain (each alias points directly to the Q-iD); the intended discipline forbids chains. The risk is composition pathology, not theoretical impossibility.

- **Whether aliases are uniform or context-sensitive.** Substrate aliases (database renaming, slug variants) are typically uniform across the system. Real-world aliases (personal names, SKOS labels in different languages) are context-sensitive. Both disciplines are coherent; they fit different needs.

## §10 — Current frontier (2013–2026)

This section gathers what each literature has developed since approximately 2013 — extending the historical coverage above through current research and the present frontier. Material is organized by literature, matching §§1–8 above, then closes with two newer literatures whose post-2013 development warrants their own subsections.

### 10.1 Linguistics and philosophy: recent work on Frege's puzzle and naming

The classic Fregean apparatus (sense/reference, opaque contexts, co-reference) remains live in contemporary philosophy of language, but the substantive new direction is the application of the apparatus to *naming politics* and *deadnaming*. Koles (2024, in *The Philosophical Quarterly*) proposes a new semantics for deadnames that explains both the disrespectfulness of deadnaming and certain linguistic data. Concurrent work in *Mind* (2025) treats deadnaming as a question of "taboo and linguistic authority." The semantic analysis is genuinely new: a deadname is not simply a former name (which would be a benign alias) but a *retired* designator whose continued use claims authority the speaker does not have. The substrate commitment that aliases are not compatibility shims for renames-in-flight is partly anticipated by this work.

Quine's referential opacity continues to organize current treatment of "two names for the same thing" in contexts where substitution fails. The classic Frege puzzle (Hesperus/Phosphorus) is now standardly treated in introductory semantics texts as the canonical case that aliases-as-pure-co-reference cannot explain on their own; sense matters.

### 10.2 Entity resolution and the deep-learning wave

The database-theoretic discipline of *record linkage* (Fellegi and Sunter 1969) and *entity resolution* (the modern term) underwent a major transformation post-2015 with the application of deep learning. The cluster of relevant work:

**DeepMatcher** (Mudgal et al., SIGMOD 2018) is the landmark paper: a design-space exploration showing that neural architectures (using embeddings, attention, and sequence-comparison primitives) substantially outperform classical entity-matching pipelines on standard benchmarks. DeepMatcher established the architectural template (per-attribute encoders, attention-based attribute comparison, classifier) that subsequent work refined.

**Neural Networks for Entity Matching: A Survey** (Barlaug and Gulla, *ACM TKDD* 2021) consolidates the post-DeepMatcher progress: distributed representations of attribute values, transformer-based encoders, contrastive losses, transfer learning across domains. The survey notes that the entity-matching task has effectively merged with the entity-linking task at the architectural level — both are now framed as deep representation learning over heterogeneous text.

**LLM-based entity resolution** is the current frontier (2023–2025). Papers including "BoostER" (Companion of *WWW* 2024), "EntGPT" (Feb 2024), and "On Leveraging Large Language Models for Enhancing Entity Resolution: A Cost-efficient Approach" (Jan 2024) explore zero-shot and few-shot prompting of LLMs (GPT-3.5, GPT-4, fine-tuned smaller models) for the matching task. The findings: LLMs handle ambiguous references and inconsistent attribute formats markedly better than supervised baselines, but cost per inference is a major operational concern. A 2025 *EDBT* paper ("A Deep Dive Into Cross-Dataset Entity Matching with Large Language Models") and a 2025 *COLING* paper ("Match, Compare, or Select? An Investigation of Large Language Models") map out the cost/quality trade-offs.

**Knowledge graph entity alignment** (a parallel literature that grew out of the linked-data world rather than the database world) has its own deep-learning wave. The 2024 *Artificial Intelligence Review* survey "Knowledge graph entity alignment research based on graph embedding" gathers it: embedding methods (TransE, RotatE, ComplEx, etc.) project entities into a vector space where geometric similarity approximates identity; contrastive learning (InfoNCE) produces representations where positive pairs (truly-aligned entities) are close and negatives are distant. Recent 2024 methods include SREA (weighted line graphs for relational structure) and PCMEA (pretrained visual model for multimodal entity representation).

For the alias question: deep-learning entity resolution treats the alias problem as a *learned similarity* problem. Two surface forms are aliases when their learned representations are sufficiently close. This is a substantively different framing from substrate-declared aliases (the intent): learned aliases are *discovered* by training, not declared in frontmatter. Both disciplines coexist in real systems (Wikidata uses both: hand-curated `altLabel`s and machine-learned matching for deduplication).

### 10.3 Programming languages: Rust, cubical type theory, recent type-theoretic work

The post-2013 PL frontier has two major strands relevant to aliases.

**Rust's ownership model** (stabilized 2015, ongoing development) takes a radically different approach to the aliasing problem from the C/C++ alias-analysis tradition. Rust enforces an *aliasing-XOR-mutability* invariant at compile time: at any moment, a value has either one mutable reference *or* any number of immutable references, never both. The borrow checker rejects programs that would violate this. The consequence: aliases (multiple references to the same value) are admitted but only when the alias relation is *read-only*; any path that mutates through an alias is rejected. The design substantively eliminates the runtime aliasing-bug class without runtime cost. Recent work on a Rust-like borrow checker for C (*POPL* 2024, *PLDI* 2024) extends the discipline to legacy code.

**Cubical type theory** (Cohen-Coquand-Huber-Mörtberg 2016, with the CCHM model) gives computational content to univalence. The Voevodsky univalence axiom in HoTT says isomorphic types are equal — an alias-of-types claim at the foundations. Cubical type theory makes the equality *computable*: equality is represented as paths in an interval-indexed structure, and transport along paths gives operational content to alias-like identifications. Cubical Agda (Vezzosi-Mörtberg-Abel, *ICFP* 2019, *JFP* 2021) implements cubical type theory in a proof assistant; the univalence "axiom" becomes a *theorem* in Cubical Agda — there is constructive content witnessing that isomorphic types can be identified, with computation rules governing what happens under that identification. Recent work includes:

- Cavallo and Harper (*POPL* 2019) on higher inductive types in cubical computational type theory.
- Lamiaux, Ljungström, and Mörtberg (2023) on computing cohomology rings in Cubical Agda.
- Van Muylder, Nuyts, and Devriese (2024) on internal and observational parametricity for Cubical Agda.
- Kaposi and Pujet (2025) on type-theory-in-type-theory with strictified syntax.

For the alias question: cubical type theory is the most mathematically-sophisticated formal framework for *alias as substantive identification with computational content*. The Pitts-Gabbay nominal-sets framing addresses alpha-equivalence for bound names; cubical addresses isomorphism for types and structures. Both are candidate categorical homes for a substrate claim about substrate aliases, with the trade-off being that nominal sets are simpler and cubical is more powerful.

### 10.4 Operating systems and addressing: SVCB DNS, modern naming

The classic DNS CNAME story (RFC 1035, 1987) has been substantively extended by **SVCB and HTTPS DNS records** (RFC 9460, November 2023). SVCB ("Service Binding") records advertise complete connection information — supported protocols, alternative endpoints, encryption parameters — in a single DNS query. The relevant alias-related innovation: SVCB supports *AliasMode*, an explicit aliasing mechanism distinct from CNAME, with a maximum chain length of 8 hops (CNAME + SVCB AliasMode combined) per RFC 9460. CNAME flattening (vendor-specific but increasingly standard) resolves CNAME chains at the authoritative server, returning the terminal A record to clients to reduce resolution latency by ~30%.

The current discipline: CNAME chains are admitted but performance-penalized; modern resolvers tolerate ~16 hops; RFC guidance is to keep chains to 1–2 hops. The substrate intended no-chain rule for aliases is more conservative than DNS practice; the consensus across deployed alias systems (DNS, email, library authority) is "chains permitted but discouraged, with hard limits."

### 10.5 Library science: BIBFRAME deployment, persistent identifier infrastructure

The post-2013 transformation in library cataloging is the slow-motion transition from MARC to **BIBFRAME** (Bibliographic Framework Initiative, Library of Congress 2011, with implementations gathering pace 2018–2026). BIBFRAME models bibliographic data as linked data with Works, Instances, and Items as core entities, with authority records linked by URI. The transition reframes the alias question: instead of see-references in flat-string authority records, BIBFRAME uses URIs and `sameAs`-style linking.

Current status as of 2024–2026:
- LC pilot project August 2024 with 15 catalogers using MARVA (the LC's linked-data editor) to create non-MARC records for non-Latin media and monographs.
- UC Davis transitioned BIBFRAME to production June 2024.
- OCLC added WorldCat Entities URIs for Persons, Places, and Events in December 2023, with Works URIs in progress — these are the OCLC's alias-bearing authority IDs.
- LC plans full RDA (Resource Description and Access) implementation in 2026, with corresponding BIBFRAME conformance.

The **persistent identifier (PID) infrastructure** for scholarly publishing has consolidated in parallel:
- **DOI** (Digital Object Identifier, Crossref and DataCite as registration agencies) for publications and datasets.
- **ORCID** (Open Researcher and Contributor ID, 2012—) for researchers; ORCID supports alternate name forms, alternate-language scripts, and historical names against the iD.
- **ROR** (Research Organization Registry, 2019—) for institutions; ROR IDs replace ad-hoc institutional names with stable references.

A *NISO* report (August 2024) and recent Crossref work (April 2025 metadata matching project for ROR-funder linkage) consolidate these into an interconnected graph: a dataset has a DOI, links to a researcher's ORCID, associated with an institution's ROR ID, connected to a funder's Crossref ID. The PIDs *are* the substrate identity; surface names are aliases on the records. Mandatory PID requirements (DOE grants, mandatory May 2025) are pushing adoption.

For the alias question: library practice has fully shifted in the post-2013 period from string-based authority (see-references on heading strings) to identifier-based identity (URIs on authority records). The shift is consequential for the alias discipline: deployed practice now treats *identifiers* as canonical and *labels* (in any language, any morphological variant) as aliases against the identifier. This is the ORCID move generalized.

### 10.6 Knowledge representation: the sameAs problem in maturity

The post-2010 work on `owl:sameAs` has produced a substantial body of evidence and several proposed remedies, consolidated in the survey **"The sameAs Problem: A Survey on Identity Management in the Web of Data"** (Raad, Pernelle, Saïs, Beek, van Harmelen, *Semantic Web* 2019, with arXiv preprint 1907.10528).

The survey identifies four categories of approach:

**(1) Alternative identity relations** — `skos:exactMatch` and `skos:closeMatch` (W3C SKOS Reference 2009), `wdt:P2888` (Wikidata exact match), `umbel:isLike`, and various similarity ontologies with hierarchical predicates. The discipline: each predicate carries weaker semantics than `owl:sameAs`, allowing publishers to express "the entities are interchangeable in some applications" without claiming full identity.

**(2) Identity management services** — centralized systems like *Okkam* (which assigned unique universal identifiers; no longer maintained) and identity observatories like *sameas.org*, *LODsyndesis*, and *sameas.cc* that aggregate `sameAs` clusters across published linked-data sources. The observatories serve as alias-resolution layers: a query for one URI returns the cluster's other co-references.

**(3) Erroneous link detection** — three sub-approaches:
- *Inconsistency-based:* detect logical conflicts using ontology axioms and unique-name assumption violations.
- *Content-based:* analyze textual descriptions, outlier patterns, attribute mismatches.
- *Network-based:* exploit density and community structure within the identity graph. Raad et al. (*ISWC* 2018) applied community detection to a corpus of 558 million `sameAs` statements and showed that links with low community-coherence are highly likely to be erroneous (100% precision at error-degree ≤ 0.4).

**(4) Context-dependent identity** — proposals like Idrissou's **lenticular lenses** (*KCAP* 2017, subsequent work) representing context-specific identity: two resources are equivalent *within* a particular domain or application, where the domain is itself a substrate entity. This generalizes Halpin and Presutti's earlier "An Ontology of Resources" (*ESWC* 2009) to a fully context-relativized identity discipline.

The survey's empirical finding is striking: studies estimate the rate of erroneous `owl:sameAs` statements at 2.8% to 20% in the deployed Web of Data. The transitive closure of all `sameAs` statements produced false-equivalence clusters where 177,000+ names referred to different countries, cities, and people across just a few transitively-merged clusters. The deployed semantics of `sameAs` is substantially weaker than the OWL formal semantics; treating it as full identity for inference is unsound at scale.

For the alias question: the deployed `sameAs` literature is the strongest cautionary tale in the survey corpus. The substrate commitments (no chains; no semantic variation; alias is morphological-only) are essentially the engineering-discipline lessons of the `sameAs` failures translated into a substrate's hand-curated regime.

### 10.7 Decentralized identity (new literature, post-2013)

A literature that did not exist when the foundational `owl:sameAs` work was published has matured substantially: **decentralized identity** (DID), formalized in the W3C **Decentralized Identifiers (DIDs) v1.0** specification, finalized as a W3C Recommendation on July 19, 2022 over formal objections from Google, Apple, and Mozilla.

A DID is an identifier of the form `did:<method>:<method-specific-identifier>` with four pillars:
- *Decentralized*: no central issuing authority is required.
- *Persistent*: the identifier continues to function without the continued operation of the issuing organization.
- *Verifiable*: control of the DID and its metadata can be proven cryptographically.
- *Resolvable*: the DID resolves to a DID document containing public keys, service endpoints, and other metadata.

The DID specification is paired with **Verifiable Credentials** (W3C VC Data Model, also a Recommendation) for issuing claims about a DID holder, and with method-specific DID schemes (`did:web`, `did:key`, `did:ion`, blockchain-based methods, etc.).

For the alias question: DIDs are the post-2013 generalization of the ORCID-style move ("the identifier is canonical, surface forms are aliases") to a context where no central authority issues identifiers. Aliases on a DID — alternate cryptographic keys, alternate service endpoints, alternate human-readable labels — are recorded in the DID document, which is itself stored and resolved through a DID method's machinery. The discipline is substrate-recorded identity (Pirate Bay your own iD; the substrate verifies; surface forms are alternates).

DIDs do not address natural-language alias variation; they address cryptographic identity. The two disciplines are complementary: DIDs settle who-is-this; SKOS and authority control settle how-they-are-named.

### 10.8 LLMs and entity disambiguation

A second literature that has emerged post-2017 with the rise of transformer-based language models: LLM-mediated entity disambiguation.

**Neural entity linking** (Sevgili et al., *Semantic Web* 2022) consolidates the architecture: mention detection → candidate generation → context-mention encoding → entity ranking. Modern systems use BERT-family encoders for context-mention representation; entity descriptions are encoded into the same vector space; similarity (typically dot product) plus softmax produces probability distributions over candidate entities. SpanBERT (Joshi et al., 2020) and span-based cross-encoders are the current high-water marks for accuracy.

**End-to-end neural co-reference** (Lee et al., *EMNLP* 2017; SpanBERT extension 2020; multilingual extensions 2021–2024) handles within-document co-reference: which mentions in a document refer to the same entity. The Lee approach considers all spans as potential mentions and learns distributions over antecedents jointly. Current systems extend this with pretrained contextual embeddings, span representations, and end-to-end training. Coreference resolution is the closest NLP analog to within-document alias resolution.

**LLM-mediated entity disambiguation** (2023–2025): work including BoostER (*WWW* Companion 2024), EntGPT (arXiv Feb 2024), and the LLM-SPARQL hybrid framework (Springer 2024) explores prompting LLMs to resolve entity references against knowledge bases like Wikidata and Wikipedia. The "Knowledge Graphs for Enhancing LLMs in Entity Disambiguation" paper (*ISWC* 2024) shows that prompting LLMs with structured KG context (entity classes, descriptions) substantially improves zero-shot ED accuracy. Apple's **ReALM** (2024, *Machine Learning Research*) treats reference resolution as a language-modeling task, with applications to on-screen entity references in conversational assistants.

For the alias question: the LLM-era treatment is the most contextual yet. Rather than declaring aliases or matching against fixed surface forms, the LLM-based systems *infer* alias relations from context — the same phrase refers to different entities in different documents, and the system learns this jointly. This is structurally further from the static-frontmatter alias discipline than any other tradition surveyed. But it informs the choice: hand-curated aliases bound morphological variation; learned aliases handle contextual variation. The two are complementary.

### 10.9 Computational ethics: naming politics, deadnaming, administrative systems

A literature that crystallized post-2018: the politics of identity in administrative systems, particularly around trans naming and deadnames. Key works:

- Koles (2024, *The Philosophical Quarterly*) — new semantics for deadnames; the disrespectfulness of deadnaming is explained by a semantic distinction between current and retired designators.
- *Mind* (2025) — deadnaming as taboo and linguistic authority; the case where using a "co-referent" surface form is a category error rather than an alias.
- "Name is a Required Field: Politics of Deadnaming in Administrative Systems" (*CHI Extended Abstracts* 2025) — the deployed administrative-system problem. Even systems with "lived name" fields are insufficient when the underlying schema preserves prior names as legitimate alternative forms. The "alias" mechanism in HR systems, government forms, and academic identity systems systematically harms trans people when the prior name is treated as an interchangeable alias rather than a retired designator.
- Visible name changes for transgender researchers (*PMC* 2021) — the academic publishing case: ORCID and other PID systems allow name changes, but legacy citations still resolve through prior names; the alias discipline needs to be retroactive, not just prospective.

Platform policies (X reviving deadname-and-misgender policies in 2024; GLAAD 2024 advocacy that all major platforms should classify targeted deadnaming and misgendering as hate speech) make the engineering choice load-bearing. A system that treats prior names as aliases on the current identifier reproduces the harm; a system that *retires* prior names without preserving them as alternatives does not.

For the alias question: this is the clearest contemporary statement of the commitment that aliases are not compatibility shims for renames. The reasons are not just engineering (clean substrate semantics) but ethical (administrative systems that preserve prior names cause real harm). The discipline that retired names are not aliases is the engineering correlate of a substantive ethical position.

### 10.10 Distributed systems: CRDTs and consistency-as-merging

A literature peripheral to alias-as-naming but central to alias-as-identity-under-concurrent-edit: **Conflict-free Replicated Data Types (CRDTs)**, formalized by Shapiro, Preguiça, Baquero, and Zawirski (2011), now widely deployed (Redis, Riak, Y.js, Automerge, recent collaborative-editing systems).

A CRDT is a replicated data structure whose merge operation is commutative, associative, and idempotent — the algebraic properties that guarantee *strong eventual consistency*: replicas that have received the same updates (in any order) converge to identical states. The state-based / op-based taxonomy organizes CRDT design.

The relevance for aliases: CRDTs solve a structurally analogous problem at the data layer. When two replicas independently mint identifiers for "the same" entity (a new contact added independently on two devices, both later sync), the merge operation must resolve which identifier is canonical and which is alias. Standard CRDT designs (LWW-Element-Set, OR-Set, RGA for sequences) handle this with timestamp ordering plus tombstones; alias-like identifiers can be derived. Y.js and Automerge are operational examples.

The 2024–2025 CRDT literature consolidates the field: Ian Duncan's "CRDT Dictionary" (2025-11-27) is a recent practitioner-oriented summary. Active research areas include privacy-preserving CRDTs, partial replication, and CRDTs over rich data types (graphs, JSON, hierarchical documents).

For the alias question: CRDTs are the engineering apparatus for *concurrent* alias resolution. The substrate substrate, edited mostly sequentially via git, does not yet need CRDT-grade machinery. But the discipline (merge as commutative-associative-idempotent operation; identifiers as substrate content; tombstones for retired identifiers) is the kind of formal apparatus a substrate-categorical claim about aliases can reference.

## §11 — Where the literatures now converge

Adding the post-2013 frontier material to the earlier §9 convergences sharpens several claims:

- **Identifier-canonical, surface-form-alias** is now the deployed consensus. ORCID, DOI, ROR, DIDs, Wikidata Q-IDs, BIBFRAME URIs, Schema.org @id, WorldCat Entities URIs, and the SKOS prefLabel/altLabel discipline all separate the persistent identifier from the surface forms that resolve to it. The transition is not merely terminological — it is structural: the identifier carries identity, the labels carry presentation. This is the strongest single convergence the surveyed literatures collectively endorse.

- **Aliases at scale require both hand-curation and machine learning.** Wikidata maintains hand-curated `altLabel`s *and* runs machine-learned deduplication. Library authority control increasingly uses ML matching (Crossref's 2024 metadata matching project) alongside cataloger judgment. The fully-curated discipline does not scale; the fully-learned discipline cannot articulate the substrate-level commitments. Deployed systems combine.

- **Strong identity semantics is fragile under composition.** The `owl:sameAs` problem (2.8%–20% error rates at scale, transitive-closure pathologies) is the most-studied failure mode. The deployed remedies — weaker predicates (`skos:closeMatch`, lenticular lenses), context-dependent identity, network-metric error detection, no-chain disciplines — all back away from strong transitive identity. The substrate no-chain rule for aliases is the discipline that survives the `sameAs` problem's empirical evidence.

- **Aliases are not synonymy is not co-reference is not contextual reference.** The literatures, taken together, mark out four distinct phenomena that the same English word "alias" sometimes covers:
  1. *Aliases proper:* alternate surface forms with no semantic content (Wikidata altLabel, SKOS altLabel, library see-references, DNS CNAME). Morphological variation only.
  2. *Synonymy:* semantically-similar-but-distinct concepts (SKOS related, library see-also references). Not aliases.
  3. *Co-reference:* alternate referring expressions for one entity in discourse (anaphora, neural co-reference). Discourse-internal, not substrate-recorded.
  4. *Contextual identity:* same entity under one set of properties, different entity under another (lenticular lenses, Halpin-Presutti contextual identity, opaque contexts). A substantive identity claim that depends on the domain of inquiry.

  The substrate commitment to morphological-only aliases corresponds to #1. The other three are separate disciplines the substrate may or may not need.

- **Retired identifiers are not aliases.** Deadnames, prior names of organizations, decommissioned URIs, expired DOI redirections, abandoned DID methods — the deployed literatures across linguistics, ethics, and engineering converge on the discipline that a retired identifier is *not* preserved as an alternative form. The substrate edit is to retire (with tombstone or witness), not to alias.

- **Substrate-recorded identity is the engineering ground.** DIDs, BIBFRAME URIs, ORCID iDs, Schema.org @id, Wikidata Q-IDs — the trend across post-2013 work is to make the identifier itself a substrate entity with cryptographic, structural, or institutional backing, against which all surface forms are aliases. This is the deployed-engineering counterpart to the "identity-by-relations": the identifier exists in the substrate; the labels are addressable forms.

The literatures diverge on:

- **Whether aliases should be declared or learned.** Curated systems (Wikidata, library authority control) declare. ML systems (entity matching, neural entity linking) learn. Deployed practice combines. No principled resolution is offered; the choice depends on operational scale.

- **Whether contextual identity is a generalization or a different relation.** Lenticular lenses and Halpin-Presutti treat contextual identity as a generalization of full identity (with full identity as the limit case of "all contexts"). Other proposals treat contextual identity as a structurally distinct relation, with its own predicate and its own semantics. The 2019 sameAs survey did not settle this; the 2024–2026 literature has not either.

- **How aliases compose under merge and federation.** CRDT-style commutative-associative-idempotent merges work for some data types but not others (notably, hierarchical document edits and arbitrary graph operations have weaker guarantees). The federation discipline for substrate aliases across independent polities is an open question the surveyed literatures collectively gesture at but do not resolve.

## What I synthesized this session that may not be in source

- The framing of "aliases" as one cross-cutting phenomenon studied across these disparate literatures is the surveyor's framing. None of the source literatures call themselves part of "alias theory." Linguistics speaks of co-reference; database theory speaks of renaming; operating systems speak of links; library science speaks of authority control; knowledge representation speaks of sameAs and labels. The unifying frame is my interpolation.

- The mapping of literature-specific terminology to a single canonical/aliased distinction is interpretive. "See reference," "altLabel," "CNAME," "alias," "renaming," "alpha-equivalence" are not literally the same concept; reading them as alternate vocabularies for a single underlying structure is a synthesizing move the literatures themselves do not make.

- The convergence claims in §9 are the surveyor's organization. Each individual literature would phrase its commitments in its own terms; reading them as collectively pointing toward "one canonical form, multiple alternate forms" is a substrate-side curation.

- The reading of HoTT's univalence axiom as relevant to substrate aliases is the surveyor's stretch. HoTT addresses types; substrate slugs are not (in any obvious way) types. The structural analogy is suggestive but not literally applicable.

- The framing of nominal sets (Pitts-Gabbay) as a candidate categorical home for the alias discipline is the surveyor's. Nominal sets address bound-name variation in formal calculi; the substrate's slug naming has bound names only by extension. The fit is partial.

- The reading of ORCID's identifier-name separation as "rendering the alias question moot" is interpretive. ORCID's actual operational state has aliases (name forms) on the iD records; the question isn't moot, just relocated to within-record from across-record.

- The trans-naming-politics example in §8.3 as a load-bearing illustration of "not every co-referent form should be an alias" is my framing. The naming-politics literature does not pose itself as a contribution to alias theory; reading it as one is interpretive.

- The reading of `owl:sameAs` problems as a "cautionary tale" for the substrate is the surveyor's gloss. The linked-data literature documents the problems on their own terms; treating them as advice for the substrate is interpolation.

- The selection of literatures covered is itself the surveyor's choice. Adjacent areas not covered: trademark and brand law (DBA names, fictitious business names); proof-assistant aliases (Lean/Coq `notation`/`abbreviation` mechanisms); namespace and module systems in programming languages (C++ `using`, Python `as`, ML signatures); REST API resource identifiers and the URI vs URL distinction (Berners-Lee 1996); fingerprinting and de-duplication algorithms (record linkage in epidemiology and statistics). Future revisions of this survey might engage them.

### Additions from the §10 frontier extension

- The framing of post-2013 work as a *single coherent frontier* across literatures is the surveyor's organization. Each of the post-2013 developments (deep-learning entity matching; Rust ownership; cubical type theory; DIDs; BIBFRAME deployment; lenticular lenses; deadname semantics; CRDT maturity) has its own discipline-internal history and was not framed by its authors as a contribution to "alias theory." The frontier-level synthesis is mine.

- The convergence claim in §11 that "identifier-canonical, surface-form-alias" is the deployed consensus across ORCID, DOI, ROR, DIDs, Wikidata Q-IDs, BIBFRAME URIs, Schema.org @id, and SKOS prefLabel/altLabel is the surveyor's reading. Each system was designed for its own constituency and constraints; observing the cross-system convergence is interpretive. It is plausibly correct but is not asserted by any individual source.

- The four-phenomena distinction in §11 (aliases proper / synonymy / co-reference / contextual identity) as a structural cut across the surveyed literatures is the surveyor's. The literatures use the word "alias" loosely; the four-fold distinction is my organization to make the commitments tractable.

- The reading of the deadname-semantics literature (Koles 2024, *Mind* 2025, *CHI* 2025) as making engineering-ethics claims about administrative-system alias discipline is partly the surveyor's. The literatures argue substantively for the ethical position; reading them as informing the no-renames-as-aliases discipline is an additional interpretive step.

- The reading of CRDTs as engineering apparatus for "concurrent alias resolution" is the surveyor's framing. CRDTs solve a structurally analogous problem (conflict-free merge); they are not framed by their authors as alias theory.

- The reading of `owl:sameAs` empirical error rates (2.8%–20%, Raad et al. 2019) as a cautionary tale specifically informing the no-chain rule for aliases is interpretive. The Raad survey documents the rates and analyzes their causes; reading them as a *lesson* for a particular substrate discipline is my application.

- The reading of cubical type theory and nominal sets as *candidate categorical homes* for a substrate claim about substrate aliases is the surveyor's framing. The respective fields develop their apparatus for their own purposes; the substrate-side application is an aspiration, not a deployed reading.

- The framing of LLM-based entity disambiguation as "structurally further from the static-frontmatter alias discipline than any other tradition" is a comparative judgment by the surveyor. LLM-based ED authors frame their work as ML on knowledge bases; the contrast with substrate-declared aliases is mine.

- §10.7 (decentralized identity) and §10.10 (CRDTs) are added as new literatures the original §§1–8 did not cover. The decision to include them as their own subsections (rather than as extensions of, say, knowledge representation or programming languages) is the surveyor's; both could plausibly be folded into adjacent sections.

## Provenance

Internal knowledge only this session. No external fetches, no archival reads. Citations are to standard texts in each literature:

**Linguistic and philosophical:** Frege (*Über Sinn und Bedeutung*, 1892), Russell ("On Denoting", *Mind*, 1905), Kripke (*Naming and Necessity*, 1980), Heim (*The Semantics of Definite and Indefinite Noun Phrases*, 1982), Reinhart (binding theory, various 1970s-80s).

**Database theory:** Codd ("A Relational Model of Data for Large Shared Data Banks", *CACM*, 1970), SQL standards (SQL-92, SQL:1999 for CTEs).

**Programming languages:** Church (*The Calculi of Lambda Conversion*, 1941), de Bruijn ("Lambda Calculus Notation with Nameless Dummies", *Indagationes Mathematicae*, 1972), Andersen (pointer analysis PhD thesis, 1994), Steensgaard ("Points-to Analysis in Almost Linear Time", *POPL*, 1996), Gabbay and Pitts ("A New Approach to Abstract Syntax with Variable Binding", *Formal Aspects of Computing*, 2002), Pitts (*Nominal Sets*, 2013).

**Operating systems and addressing:** Ritchie and Thompson on early Unix (links and inodes, 1974); Apple Alias Manager documentation (Mac OS 7, 1991); Mockapetris (RFC 1035 — DNS, 1987); Postel and others on SMTP and aliases (RFC 821 and successors).

**Library and information science:** IFLA *Functional Requirements for Authority Data* (FRAD, 2009), Resource Description and Access (RDA, 2010), Library of Congress Name Authority File (NAF, ongoing), Virtual International Authority File (VIAF, 2003—), ORCID (2012—).

**Knowledge representation:** OWL (W3C, 2004 and 2012 revisions), SKOS (W3C, 2009), Halpin et al. ("When owl:sameAs Isn't the Same", *ISWC*, 2010), Halpin and Presutti (context-dependent identity work, 2011), Wikidata documentation (2012—).

**Logic and category theory:** Awodey, Voevodsky, et al. (*Homotopy Type Theory: Univalent Foundations of Mathematics*, 2013), Pitts (nominal sets, 2002, 2013), the Coq, Lean, and Agda documentation on quotient types.

**Sociology and naming:** Chaum ("Untraceable Electronic Mail, Return Addresses, and Digital Pseudonyms", *CACM*, 1981), general naming-and-pseudonymity literature.

### Citations added for the §10 frontier extension

**Entity resolution / record linkage:** Mudgal et al. ("Deep Learning for Entity Matching: A Design Space Exploration", *SIGMOD* 2018, "DeepMatcher"); Barlaug and Gulla ("Neural Networks for Entity Matching: A Survey", *ACM TKDD* 2021); Wang et al. ("BoostER: Leveraging Large Language Models for Enhancing Entity Resolution", *WWW* Companion 2024); Zhang et al. ("EntGPT: Linking Generative Large Language Models with Knowledge Bases", arXiv 2024); 2025 *EDBT* and *COLING* papers on LLM-based entity matching cost/quality.

**Knowledge graph entity alignment:** 2024 survey in *Artificial Intelligence Review* (Springer); Zhang et al. ("SREA", 2024); Wang et al. ("PCMEA", 2024); Sun et al. (benchmarking study, *VLDB* 2020).

**Programming languages — Rust:** Rust language reference and the *Rust Programming Language* book (Klabnik and Nichols, current edition); recent work on Rust-like borrow checking for C (*POPL* 2024, *PLDI* 2024); Fallin ("Safe, Flexible Aliasing with Deferred Borrows", *ECOOP* 2020).

**Cubical type theory and HoTT:** Cohen, Coquand, Huber, Mörtberg ("Cubical Type Theory: a constructive interpretation of the univalence axiom", *TYPES* 2015 / *POST-PROCEEDINGS* 2016 — the CCHM model); Vezzosi, Mörtberg, Abel ("Cubical Agda: A Dependently Typed Programming Language with Univalence and Higher Inductive Types", *ICFP* 2019, *JFP* 2021); Cavallo and Harper ("Higher Inductive Types in Cubical Computational Type Theory", *POPL* 2019); Lamiaux, Ljungström, Mörtberg (cohomology rings in Cubical Agda, 2023); Van Muylder, Nuyts, Devriese (internal and observational parametricity, 2024); Kaposi and Pujet (type-theory-in-type-theory with strictified syntax, 2025).

**DNS modernization:** RFC 9460 (SVCB and HTTPS Resource Records, November 2023); Cloudflare's CNAME flattening (deployment 2014—).

**Library science:** BIBFRAME (Library of Congress, 2011—); LC pilot project August 2024 with MARVA; UC Davis production transition June 2024; OCLC WorldCat Entities URIs (Persons/Places/Events December 2023, Works in progress); RDA 3R Project (2018–2026); ROR (Research Organization Registry, 2019—); Crossref metadata-matching project April 2025; NISO PIDs report (August 2024).

**Knowledge representation — the sameAs problem:** Raad, Pernelle, Saïs, Beek, van Harmelen ("The sameAs Problem: A Survey on Identity Management in the Web of Data", *Semantic Web* 2019; arXiv 1907.10528); Raad et al. ("Detecting Erroneous Identity Links on the Web Using Network Metrics", *ISWC* 2018, 558M `sameAs` corpus analysis); Idrissou et al. ("Lenticular Lenses", 2017 and subsequent); SKOS Reference (W3C Recommendation 2009).

**Decentralized identity:** W3C *Decentralized Identifiers (DIDs) v1.0* Recommendation (July 19, 2022); W3C *Verifiable Credentials Data Model* (Recommendation); various DID Methods specifications.

**LLM entity disambiguation:** Sevgili et al. ("Neural Entity Linking: A Survey of Models Based on Deep Learning", *Semantic Web* 2022); Lee et al. ("End-to-end Neural Coreference Resolution", *EMNLP* 2017); Joshi et al. ("SpanBERT: Improving Pre-training by Representing and Predicting Spans", *TACL* 2020); Pražák et al. (multilingual coreference resolution, 2021—); Apple ML Research ("ReALM: Reference Resolution as Language Modeling", 2024); the 2024 *ISWC* paper on knowledge-graph-enhanced LLM entity disambiguation.

**Computational ethics:** Koles (deadname semantics, *The Philosophical Quarterly* 2024); *Mind* 2025 (deadnaming, taboo, and linguistic authority); "Name is a Required Field: Politics of Deadnaming in Administrative Systems" (*CHI Extended Abstracts* 2025); the visible-name-changes-for-transgender-researchers paper (*PMC* 2021); GLAAD platform-policy advocacy (2024).

**Distributed systems / CRDTs:** Shapiro, Preguiça, Baquero, Zawirski ("Conflict-Free Replicated Data Types", *SSS* 2011); Ian Duncan ("The CRDT Dictionary: A Field Guide to Conflict-Free Replicated Data Types", 2025); deployed systems: Redis, Riak, Y.js, Automerge.

**Wikidata and Schema.org:** Wikidata documentation on multilingual labels and aliases; Wikidata Help:Deduplication; Schema.org `sameAs` and `@id` documentation; the Crossref/ORCID/ROR-Wikidata integration story.

This survey is research output; the settled records (`prose/teaching/explanations/`, `code/structures/`, `work/governance/rules/specifications/`, `prose/learning/claims/`) MUST NOT cite this survey as authority. Downstream lift work — the alias concept, structure, specification, and claim — will read this survey and select; selection in the survey itself would corrupt the gather.

## Status

`status: draft` — appropriate for a session-internal-knowledge survey that has not been audited against primary sources. Future passes may revise individual sections against the cited primary sources, add the literatures named as not-covered, and revise the convergences in §9 as the alias work surfaces sharper questions.
