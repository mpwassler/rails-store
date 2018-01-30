<script>

import ProductVariationForm from './product_variation_form'

const data = () => ({

})

const methods = {

}

const computed = {

}

const props = {
    variation: null
}

const mounted = function() {
    console.log(this.variation)
}

export default {
  data,
  methods,
  computed,
  props,
  render() {
  	return (
      <div>
        <ProductVariationForm 
        title={this.variation.title}
        sku={this.variation.sku}
        price={this.variation.price}
        id={this.variation.id}
        productId="1" />
      </div>
  	)
  } 
}
</script>

<style lang="css" scoped>
</style>