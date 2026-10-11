import test from 'node:test';
import assert from 'node:assert/strict';
import {firstMatchingIssue,uniqueIssueOrRefusal} from './issue-custody-selector-counterexample.mjs';
const issue=(n,props={})=>({number:n,author:{login:'publisher'},title:'Repair observed Koios.News newsroom deficiency',body:'<!-- koios-feedback:newsroom -->\nObserved...',state:'OPEN',...props});
test('two publisher-authored lookalikes make first-match identity depend on list order',()=>{
 const a=issue(4),b=issue(104);
 assert.equal(firstMatchingIssue([a,b],'newsroom','publisher').number,4);
 assert.equal(firstMatchingIssue([b,a],'newsroom','publisher').number,104);
 assert.throws(()=>uniqueIssueOrRefusal([a,b],'newsroom','publisher'),/ambiguous/);
 assert.throws(()=>uniqueIssueOrRefusal([b,a],'newsroom','publisher'),/ambiguous/);
});
test('foreign author and buried marker do not qualify for exact custody',()=>{
 assert.equal(uniqueIssueOrRefusal([issue(8,{author:{login:'attacker'}}),issue(9,{body:'text\n<!-- koios-feedback:newsroom -->'})],'newsroom','publisher'),null);
});
test('one publisher-owned exact issue qualifies regardless of unrelated others',()=>{
 assert.equal(uniqueIssueOrRefusal([issue(8,{author:{login:'other'}}),issue(7)],'newsroom','publisher').number,7);
});
test('overlarge issue scan and invalid state refuse',()=>{
 assert.throws(()=>uniqueIssueOrRefusal(Array.from({length:1000},(_,i)=>issue(i+1)),'newsroom','publisher'),/incomplete/);
 assert.equal(uniqueIssueOrRefusal([issue(7,{state:'CUSTOM'})],'newsroom','publisher'),null);
});
