/** No GitHub effect. Structural counterexample to choosing the first matching
 * mutable issue record. The service publisher in Causeway PR #88 checks author,
 * exact title, initial marker and state but uses Array.find on eligible issues.
 */
export function qualifiedIssue(issue, name, publisher){
 return issue?.author?.login===publisher && issue.title===`Repair observed Koios.News ${name} deficiency` &&
   typeof issue.body==='string'&&issue.body.startsWith(`<!-- koios-feedback:${name} -->`)&&
   Number.isSafeInteger(issue.number)&&issue.number>0&&['OPEN','CLOSED'].includes(issue.state);
}
export function firstMatchingIssue(issues,name,publisher){return issues.find(i=>qualifiedIssue(i,name,publisher))??null;}
export function uniqueIssueOrRefusal(issues,name,publisher){
 if(!Array.isArray(issues)||issues.length>=1000)throw new Error('incomplete diagnostic issue scan');
 const candidates=issues.filter(i=>qualifiedIssue(i,name,publisher));
 if(candidates.length>1)throw new Error('ambiguous publisher diagnostic custody');
 return candidates[0]??null;
}
