# PlainEng for human–agent and agent–agent communication

**Protocol and pragmatic language science proposal, 2026-10-10.** This is not a new security protocol, service deployment, or grant of authority. A human-readable English surface must survive as a first-class artifact; typed machine projections and admission receipts supplement it.

## Language as situated cooperation

A useful English for the current century can carry more than propositions. Agents ask questions, negotiate reference, report observations, make hypotheses, cite sources, propose actions, accept or reject tasks, and repair errors. Human writers do the same without always labeling the act. Formal PlainEng can selectively *make those acts explicit* where machines must safely coordinate.

Differentiate the following layers in an utterance exchange:

1. **Source** — original marks/bytes, sender, time, version, channel and quotation boundaries.
2. **Interpretation** — candidate English grammatical analyses, sense and referent bindings, discourse context and uncertainty.
3. **Propositional content** — typed claims with speaker/attribution and effective temporal/domain scope.
4. **Evidence** — observed/testified/derived for-or-against witnesses; possible lack of evidence is not falsity.
5. **Speech act** — assertion, question, request, proposal, acknowledgement, refusal, clarification, commitment, withdrawal.
6. **Authority** — independent permission of principal/office/capability to execute a named side effect.
7. **Effect** — admitted external work, result and independently checked receiving receipt.

The sentence “Please publish the paper” is understandable English and can be parsed as a request. It does not, without a separate authorization contract, permit an agent to publish anything. “The paper was published” can be a speaker's assertion even if no deployment/publication receipt exists. That distinction is operational semantics, not bureaucratic style.

## An illustrative typed envelope

The fields below are a **proposed data contract**; it is not current MetroPlat or ActivityPub schema, and should not be published as an interoperability standard until typed, tested and authorized.

~~~json
{
  "kind": "plaineng.candidate-exchange",
  "version": "0.1-proposal",
  "language": "en-US",
  "englishBundle": {
    "package": "@lenticule-science/english-language-algebra",
    "revision": "REQUIRES_VERIFICATION"
  },
  "source": {
    "text": "The operator reports that the service is live.",
    "identity": "CONTENT_ID_REQUIRED",
    "speaker": "SPEAKER_REF_REQUIRED"
  },
  "speechAct": "report",
  "interpretation": {
    "state": "candidate",
    "attribution": "speaker reports live(service)",
    "unresolved": ["service referent", "source witness"]
  },
  "claimEvidence": {
    "state": "unverified",
    "witnessesFor": [],
    "witnessesAgainst": []
  },
  "effect": {
    "authorized": false,
    "executed": false
  }
}
~~~

The placeholders are deliberately **not** real identifiers. A real implementation must reject or explicitly downgrade unknown source and type information. The message is still accessible to a human through its original English. Its JSON does not certify that the author intended that exact logical form.

## Controlled speech acts

- **Assert:** “Observed at 09:32 UTC: the endpoint returned HTTP 503.” Receiver records the claimed observation with exact method/source; does not treat it as independently verified.
- **Question:** “Did the endpoint return HTTP 503 after the restart?” This is a request for evidence, not a false assertion.
- **Propose:** “Proposed: restart the worker after the queue drains.” Not an operative change request without further authority.
- **Request:** “Please check the current deployed revision.” The receiver can determine whether a permitted read exists.
- **Clarify:** “Does ‘the operator’ refer to the service account or the on-call person?” A source-referent repair.
- **Acknowledge:** “Received the request and its source revision.” Not the same as accepting responsibility to execute.
- **Accept:** “Accepted under capability C for read-only verification.” Actual capability C must be independently verified.
- **Refuse:** “The request requires publishing authority not held by this receiver.” An informative boundary, not a broken English parse.
- **Retract:** “I withdraw the previous claim that the worker was deployed.” Preserve the earlier statement and time; do not erase it.
- **Report:** “Measured: three failed requests out of 50 at 09:32 UTC.” State method, sample and population.

All examples are proposed language tests. Each act requires a consistent conversation reference, versioned context and source receipts.

## Context drift, negotiation and mixed participants

Two agents may parse the same phrase using different domain vocabularies or English bundle versions. They need a protocol for *disclosing* that difference, asking for the missing binding and negotiating a shared reading. SignGraph site/overlap models can help detect mismatched contexts, while SignCraft may derive and settle consequences **after** admission of the relevant evidence. A human can participate using the English surface and explanation of unresolved distinctions.

A reader should be able to inspect:
- what the message literally said and which source supplied it;
- which alternatives the grammar/semantic analysis proposed;
- what evidence (if any) supports the claim;
- what is still unknown;
- what action, if any, the recipient is authorized to take;
- how to correct a misreading without rewriting the original evidence.

Make these inspectable before optimizing machine-to-machine compactness.

## Agent-language interchange and scientific hypotheses

1. A smaller controlled grammar with explicit speech acts and evidence state may reduce cross-model attribution and authorization errors relative to unconstrained English.
2. A multi-turn clarification protocol may reduce expensive errors more reliably than adding parser compute for all utterances.
3. A versioned meaning representation and readable realization may improve reconstruction of an agent's decision by a human reviewer compared with prose-only logs.
4. Rich evidence/fiber representations may increase computational cost and confuse readers if exposed without an appropriate explanation.

All four are **testable** and subject to negative results. Evaluation includes cross-model agreement, false authorizations, error recovery, latency/compute, reader paraphrase/task success, and the ability to abstain when referents or capabilities are absent.

## Research-to-engineering obligations

Version the source English grammar and terminology. Preserve exact human text and cited evidence. Generate a typed candidate as a candidate. Do not mint SignCell witnesses from an unsupported English inference. Pass independently admitted witnesses through SignChain/SignCraft only under a known rule/authority. Require a separate real-world-effect admission path for publication, purchases, code changes or communication on others' behalf.

External transports—ActivityStreams, CloudEvents, structured HTTP bodies, Semioverse resources—are potential carrier envelopes; they are not proofs of meaning or permission. Do not propose a new protocol layer where established ones suffice.

See [PlainEng controlled language](plaineng-constrained-english-theory.md), [Sign/fiber/sheaf model](signstack-fiber-sheaf-interpretations.md), [science #61](https://github.com/lenticule-science/science-services-section/issues/61), and [Red Cup integration #6](https://github.com/red-cup-engineering/ptgae-engineering-services-section/issues/6).
