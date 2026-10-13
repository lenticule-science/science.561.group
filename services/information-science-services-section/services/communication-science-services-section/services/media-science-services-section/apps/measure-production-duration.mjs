#!/usr/bin/env node
/** Source-owned Lenticule Science receiving from existing actual provider
 * attempt/independent-review collections. No new media job, quote, calendar
 * record, model invocation, or financial settlement is created here.
 */
import {readFile} from 'node:fs/promises';
import {measureStudioProductionDuration} from '../src/production-duration-metrology.mjs';
export async function measureProductionFile(args){
 const [path,asOf,minSamples,freshDays,...extra]=args;
 if(!path||!asOf||minSamples===undefined||freshDays===undefined||extra.length)
  throw new TypeError('Usage: measure-production-duration.mjs ORIGINAL-ATTEMPTS.json AS_OF MIN_ACCEPTED_CASES MAX_AGE_DAYS');
 const text=await readFile(path,'utf8');
 if(text.length>5_000_000)throw new TypeError('source attempt collection exceeds 5 MB');
 const packet=JSON.parse(text),attempts=packet.attempts??packet;
 return measureStudioProductionDuration({attempts,asOf,
  minAcceptedSamples:Number(minSamples),maxAgeDays:Number(freshDays)});
}
if(import.meta.main){
 measureProductionFile(process.argv.slice(2)).then(v=>{
  process.stdout.write(JSON.stringify(v,null,2)+'\n');
 }).catch(error=>{
  process.stderr.write(String(error?.message??'Production duration receiving failed')+'\n');
  process.exitCode=1;
 });
}