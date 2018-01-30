<script>
import AddProductVariation from './components/add_product_variation.vue'
import ProductVariationList from './components/product_variation_list.vue'
import ProductVariationEdit from './components/product_variation_edit.vue'

const modes = {
  LIST: 'list',
  ADD: 'add',
  EDIT: 'edit'
}

const data = () => ({
  message: "Hello Vue!",
  mode: modes.LIST,
  variation: null
})

const methods = {
    switchView(e){
      e.preventDefault()
      this.mode = modes.ADD
    },
    
    viewList(e){
      e.preventDefault()
      this.mode = modes.LIST
    },

    handleEdit(variation) {      
      this.variation = variation
      this.mode = modes.EDIT
    }
}

const computed = {
  currentView(){
    switch (this.mode) {
      case modes.LIST:
        return <ProductVariationList on-edit-variation={this.handleEdit} />
      case modes.ADD:
        return <AddProductVariation />
      case modes.EDIT:
        return <ProductVariationEdit variation={this.variation} />
    }
  }
}

export default {
  methods,
  data,
  computed,
  render() {
    return (
      <div class="variation_builder">
        <p>Product Variations</p>
        <div>   
          {this.currentView}          
        </div>
        { modes.LIST == this.mode ? 
          <button onClick={this.switchView} class="btn btn-primary">Add Variation</button> 
        :
          <button onClick={this.viewList} >Back</button>
        }        
      </div>
    )
  }
}

</script>

<style scoped>
.variation_builder {
  margin: 40px 0 40px 0;
}
</style>
