(let [changelog (require :changelog)
      folder (require :folder)
      mc (changelog.make-changelog nil nil (folder.make-folder :data))]
  mc)
