window.addEventListener('load', () => {
  const tagField = document.getElementById('tag-name')
  const addTagBtn = document.getElementById('add-tag-btn')
  const tagList = document.getElementById('registration-table')
  console.log(tagList)

  addTagBtn.addEventListener('click', () => {
    const tagName = tagField.value
    const HTML = `
      <input name="spot_tag[tag_ids][]" class="tags" value="${tagName}" style="display: none;">${tagName}
    `

    tagList.insertAdjacentHTML("afterend", HTML)
    tagField.value = ""
  })


})