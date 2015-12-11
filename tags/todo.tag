<todo>
    <h3>{ opts.title }</h3>
    <ul>
      <li each={ items }>
        <label class={ completed: done }>
          <input type="checkbox" checked={ done } onclick={ parent.toggle }> { title }
        </label>
        <a href="#" onclick={ remove }>X</a>
      </li>
    </ul>

   	<todo-form number_of_todos="{ items.length }"></todo-form>

	<style>
      todo h3 { font-size: 220%; color: red; }
    </style>

    this.items = opts.items
    
    toggle(e) {
      var item = e.item
      item.done = !item.done
      return true
    }

    remove(e){
      var item = e.item
      this.items.splice(this.items.indexOf(item), 1)
    }

	add(itemText) {
      this.items.push({ title: itemText, done: false, hidden: false })
      this.update()
	}

    this.on('mount', function () {
        console.log("Tag mounted")
    })
</todo>

<todo-form>
	<form onsubmit={ add }>
	  <input name="input" onkeyup={ edit }>
	  <button disabled={ !text } >Add #{ opts.number_of_todos + 1 }</button>
	</form>
	
	var parent = this.parent

	edit(e) {
      this.text = e.target.value
    }

    add(e){
		if (this.text) {
		  parent.add(this.text)
		  this.text = this.input.value = ''
		}
	}
</todo-form>