<todo>
    <h3>{ opts.title }</h3>

    <ul>
      <li each={ item, i in items }>
		   <todo-item todo_item="{ item }" />
      </li>
    </ul>

   	<todo-form number_of_todos="{ items.length }"></todo-form>

	<style>
      todo h3 { font-size: 220%; color: red; }
    </style>

    this.items = opts.items
    
    remove(item){
      this.items.splice(this.items.indexOf(item), 1)
      this.update()
    }

	add(itemText) {
      this.items.push({ title: itemText, done: false, hidden: false })
      this.update()
	}

    this.on('mount', function () {
        console.log("Tag mounted")
    })
</todo>

<todo-item>
	<label class={ completed: todo_item.done }>
		<input type="checkbox" checked={ todo_item.done } onclick={ parent.toggle }>
		{ todo_item.title }
	</label>
	<a href="#" onclick={ parent.remove }>X</a>

	this.todo_item = opts.todo_item
	var parent = this.parent

    toggle(e) {
      var item = e.item
      item.done = !item.done
      return true
    }

    remove(e){
      var item = e.item
      parent.remove(item)
    }
</todo-item>

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