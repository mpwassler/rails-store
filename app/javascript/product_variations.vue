<script>

import ProductVariationList from './components/product_variation_list.vue'
import ProductVariationForm from './components/product_variation_form.vue'

const modes = {
  LIST: 'list',
  ADD: 'add',
  EDIT: 'edit'
}

const data = () => ({
  message: "Hello Vue!",
  mode: modes.LIST,
  variation: null,
  product_id: window.product || ""
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
    },
    
    handleSave(res){
      this.mode = modes.LIST
    }
}

const computed = {
  currentView(){
    switch (this.mode) {
      case modes.LIST:
        return <ProductVariationList product_id={this.product_id} on-edit-variation={this.handleEdit} />
      case modes.ADD:
        return  <ProductVariationForm on-save={this.handleSave} productId={this.product_id} />
      case modes.EDIT:
        return <ProductVariationForm 
                on-save={this.handleSave}
                title={this.variation.title}
                sku={this.variation.sku}
                price={this.variation.price}
                id={this.variation.id}
                productId={this.product_id} />
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
        <div>   
          {this.currentView}          
        </div>
        { modes.LIST == this.mode ? 
          <button onClick={this.switchView} class="btn btn-primary">Add Variation</button> 
        :
          <button onClick={this.viewList} class="btn btn-danger">Back</button>
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
