<script>

const data = () => ({
  variations: []
})

const methods = {
  getVariationsList() {
    window.axios.get('/product_variations.json').then( res => {      
      this.variations.push( ...res.data ) 
    })
  },
  
  edit(variation) {    
    console.log(variation)
    console.log(this)
    this.$emit('edit-variation', variation)              
  }
}

const mounted = function () {  
  this.getVariationsList()
}

export default {
  data,
  methods,
  mounted,
  render() {
    let {$emit} = this
  	return (
      <div>
        {this.variations.map( (variation) => {
          return (
            <div>
              <h2>{variation.title}</h2>
              <p>{variation.sku}</p>
              <p>${variation.price}</p>
              <button onClick={ (e) => {
                e.preventDefault()
                this.edit(variation)
              } }>Edit</button>
            </div>
          )
        })}
      </div>
  	)
  } 
}
</script>

<style lang="css" scoped>
</style>