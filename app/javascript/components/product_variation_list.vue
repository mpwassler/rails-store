<script>

const data = () => ({
  variations: []
})

const methods = {
  getVariationsList() {    
    window.axios.get(`/product_variations/product/${this.product_id}`).then( res => {            
      this.variations.push( ...res.data ) 
    })
  },
  
  edit(variation) {    
    this.$emit('edit-variation', variation)              
  }
}

const mounted = function () {    
  this.getVariationsList()
}

const props = ['product_id']
const watch = {
  product_id(newVal, oldVal){    
     this.getVariationsList()
  }
}

export default {
  data,
  methods,
  mounted,
  props,
  watch,
  render() {
    let {$emit} = this
  	return (
      <div class="variations">
        {this.variations.map( (variation) => {
          return (
            <div class="variation" key={variation.id}>
              <button class="variation_btn btn btn-primary" onClick={ (e) => {
                e.preventDefault()
                this.edit(variation)
              } }>Edit</button>
              <h2 class="variation_title">{variation.title}</h2>
              <p class="variation_attribute attribute-sku">{variation.sku}</p>
              <p class="variation_attribute attribute-price">${variation.price}</p>
            </div>
          )
        })}
      </div>
  	)
  } 
}
</script>

<style lang="css" scoped>
.variations{
  margin: 20px 0;
}
.variation{
  margin: 40px 0;
  border-top: 2px solid rgb(79, 165, 180);
  padding: 20px;
  background-color: rgba(244, 244, 244, 0.39);
  box-sizing: border-box;
}
  .variation_title{
    font-size: 18px;
  }
  .variation_attribute{
    font-size: 14px;
  }
  .variation_btn{
    float: right;
  }
</style>