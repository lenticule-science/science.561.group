import { s3Resource } from '@red-cup-engineering/http-services-section/s3';

/** The author's view of the Gemini notebooks as S3 buckets, signed in with this machine's notebooklm login on first use. */
export const BUCKETS_PATH = '/buckets';
export function notebookBuckets() {
  let opened;
  const buckets = () => (opened ??= import('@red-cup-engineering/gemini-notebook-services-section/gemini-notebook-buckets')
    .then(({ createGeminiNotebookBuckets }) => createGeminiNotebookBuckets())
    .catch((error) => { opened = undefined; throw error; }));
  const delegate = (name) => async (...args) => (await buckets())[name](...args);
  return s3Resource({ listBuckets: delegate('listBuckets'), listObjects: delegate('listObjects'), headObject: delegate('headObject'), getObject: delegate('getObject') }, { mount: BUCKETS_PATH, id: 'gemini-notebook-buckets', title: 'Gemini Notebook' });
}
