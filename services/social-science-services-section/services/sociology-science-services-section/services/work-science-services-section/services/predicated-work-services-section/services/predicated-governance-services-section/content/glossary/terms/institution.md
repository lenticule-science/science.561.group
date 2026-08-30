---
type: definition
class: status-function-system
status: draft
symbol: I
depends-on: [normative-system, office-as-double-settlement, jural-relation]
realizes: [institution]
---

# Institution

The mathematical realization of an [institution](../../../../../../governance-services-section/content/glossary/terms/institution.md) per the library's quintuple definition: a system of *constitutive rules* of the form "X counts as Y in context C" maintained by collective recognition. Per Searle's [status-function-declaration](../../../../../../governance-services-section/content/glossary/terms/status-function-declaration.md), institutions create institutional facts by collective acceptance.

## Data

An institution $I$ is a quintuple

$$I \;=\; (\mathrm{Pos},\; D,\; \mathrm{CR},\; \mathrm{Rec},\; \mathrm{BG})$$

instantiated on the operations base:

- $\mathrm{Pos} \subseteq E_{\mathrm{op}}$ — the set of *positions* (offices) the institution constitutes. Each position is an [office-as-double-settlement](office-as-double-settlement.md).
- $D : \mathrm{Pos} \to (\mathrm{Action} \to \{\texttt{power}, \texttt{duty}, \texttt{privilege}, \texttt{immunity}\})$ — the *deontic profile assignment*. For each position $p \in \mathrm{Pos}$ and each action $a$ in $p$'s domain, $D(p)(a)$ specifies the Hohfeldian kind. Realized as the [jural-relations](jural-relation.md) attached to each position-office.
- $\mathrm{CR} \subseteq E_{\mathrm{op}}$ — the *constitutive rule set*. Each rule is a substrate entity carrying cells of the form "X counts as Y in context C": $\langle r, \texttt{counts-as-source}, X\rangle$, $\langle r, \texttt{counts-as-target}, Y\rangle$, $\langle r, \texttt{in-context}, C\rangle$. The rules generate institutional facts.
- $\mathrm{Rec}$ — the *collective recognition* state. A cell $\langle I, \texttt{collectively-recognized-by}, \mathrm{Group}, \texttt{at-stage}, \tau\rangle = \mathbf{t}$ for each stage $\tau$ at which the institution is operative.
- $\mathrm{BG}$ — the *background conditions*: brute-fact substrate cells the institution relies on but does not itself create.

## Operativity

The institution is *operative at stage $\tau$* iff three conditions hold simultaneously:

- $\mathrm{CR}$ is *consistent*: no two rules in $\mathrm{CR}$ have contradicting consequents on the same source-context pair. As substrate condition: a closure rule scans $\mathrm{CR}$ for $\top$-creating overlaps.
- $\mathrm{Rec}_\tau = \mathbf{t}$: collective recognition cell at stage $\tau$. This cell is itself maintained by ongoing acts of recognition (per Searle: "X counts as Y in C" requires participants accept that it does). When recognition lapses, the cell moves toward $\bot$ or $\mathbf{f}$.
- $\mathrm{BG}_\tau$ holds: the background conditions cells are settled at stages compatible with the institution's operation.

## Constitutive rule firing

When a brute fact $X$ obtains in context $C$, the constitutive rule fires:

$$\langle X, \texttt{at-stage}, \tau\rangle = \mathbf{t} \,\wedge\, \langle X, \texttt{in-context}, C\rangle = \mathbf{t} \,\wedge\, \langle r, \texttt{counts-as}, (X, Y, C)\rangle = \mathbf{t} \,\wedge\, \mathrm{Rec}_\tau \;\Longrightarrow\; \langle Y, \texttt{at-stage}, \tau\rangle = \mathbf{t}$$

The rule's consequent asserts the *institutional fact* $Y$. Substrate-algebraically, this is a closure rule whose consequent settles a cell that names a *socially-constituted entity* (a contract, a marriage, a citizenship, a bank-note's value-as-currency).

The rule's firing requires the recognition cell $\mathrm{Rec}_\tau$. Without recognition, the consequent does not settle: the brute fact remains brute, the institutional fact does not arise.

## Three traditions, three structural readings

Per the library's institution text, three traditions ground institutions differently. Substrate-algebraically:

**Searle (constitutive rules and status-functions).** The "X counts as Y in C" rule schema. Substrate-algebraic content: the constitutive-rule cells in $\mathrm{CR}$ and their firing on recognition. Status-function-declarations install deontic profiles on positions.

**North (institutions as rules of the game vs. organizations as players).** The institution is the rule-system $\mathrm{CR}$; an organization is a player operating *within* the rules. Substrate-algebraic content: $I$'s rules are settled cells in $\mathcal{S}_{\mathrm{op}}$ that constrain other agents' increments. An organization is an entity with members who play *under* those rules. The distinction matters for analysis: changing rules requires altering $I$'s $\mathrm{CR}$; changing organizational behavior requires altering increment patterns *under* fixed $\mathrm{CR}$.

**Hodgson (institutions reshape agent dispositions over time).** The institution's persistent presence over many stages reshapes which closure rules fire on agents' acts. Substrate-algebraic content: agents subjected to $I$ accumulate cells like $\langle a, \texttt{habituated-to}, r\rangle = \mathbf{t}$ for rules $r \in \mathrm{CR}$, after sufficient exposure. Habituation cells affect the agent's settling: the agent's increments reflect the institution's rules even when the explicit rule-cells are not consulted.

## Institution vs. normative system

A [normative system](normative-system.md) is the more general structure: a collection of norms with authority, scope, and coherence. An institution is a normative system *with positions and constitutive rules*: $I$'s $\mathrm{CR}$ generates the institutional facts that the norms apply to.

Every institution is a normative system; not every normative system is an institution. A pure declarative normative system (norms without status-function-declarations) does not constitute new institutional facts; it just regulates existing brute facts. An institution's distinguishing feature is that it *creates the facts it then regulates*: contracts, marriages, money, citizenship, offices — these are institutional facts that exist only because the institution constitutes them.

## Institution and charter

A [charter](../theorems/charter-as-closure-system.md) is the *founding* of an institution: a charter constitutes the institution's positions, deontic profiles, and constitutive rules. Substrate-algebraically: charter rules in $\mathcal{S}_{\mathrm{rules}}$ create the cells that comprise $I$'s quintuple. The charter is itself an institutional fact (created by some prior institution: the founding body, the constitutional convention) that constitutes a new institution.

The recursive structure terminates: at the foundational level, the *Grundnorm* (Kelsen) or the *rule of recognition* (Hart) is a presupposed structure not constituted by any prior institution. Substrate-algebraically: the foundational cells are *initial-state* cells $v_0$ in the operations settling, not created by any closure rule firing.

## Institution and corruption

The library's institution text (drawing on MacIntyre) names *institutional corruption*: the institution comes to pursue its own perpetuation rather than its internal goods. Substrate-algebraically: a closure rule fires on $\mathrm{Rec}$ cells in a way that makes recognition self-referential — the institution is recognized because it is recognized, not because it constitutes valuable institutional facts. The cell pattern is detectable: the recognition cell is settled by closure rules that consult only other recognition cells, not external valuation cells. This is the substrate-algebraic content of "the institution has begun to perpetuate itself rather than serve its function."

The MacIntyre/[enterprise](../../objects/enterprise.md) connection: an enterprise's hard-core $C$ is its institution's constitutive rules; degeneration of the enterprise (per [enterprise](../../objects/enterprise.md)) corresponds to the institution's recognition cells decoupling from the institution's substantive purposes.

## Connection to polity

A *polity* (forthcoming object) is an institution whose positions include a *populace* — a collective of natural persons who are simultaneously the recognition-providers and the subjects of the institution's rules. Polities are the special case where $\mathrm{Rec}$ is generated by the same agents who are bound by the institution. Most polities are institutions; not all institutions are polities (a corporation has positions but its recognition can come from outside its membership, e.g., from regulators).
