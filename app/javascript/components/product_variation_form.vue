<script>

const data = () => ({
  newFields: {
    title: '',
    sku: '',
    price: 0
  }
})

const methods = {
  handleTileUpdate(e) {
    this.newFields.title = e.target.value
  },

  handleSkuUpdate(e) {
    this.newFields.sku = e.target.value
  },

  handlePriceUpdate(e) {
    this.newFields.price = e.target.value
  },

  handleSubmit(e) {
    e.preventDefault()
    let {sku, title, price} = this.newFields
    if (this.id) {

    } else {
      window.axios.post('/product_variations', {
        sku, title, price, product_id: this.props.product_id
      })
    }    
  }
}

const props = {
  title : {type: String, default : ' '},
  sku: {type: String, default: 'ABC123'},
  price: {type: Number, default:0},
  id: {type: Number},
  productId: {type:null, default: 1}
}

export default {
  data,
  methods,
  props,

  render() {
    console.log(this.props)
    this.props = this.props || {}
  	return (
      <div >
        <div class="form-group">
          <label>Title</label>
          <input onChange={this.handleTileUpdate} value={this.title} type="text" class="form-control" name="title" />
        </div>
        <div class="form-group">
          <label>Sku</label>
          <input onChange={this.handleSkuUpdate} value={this.sku} type="text" placholder="-- -- --" class="form-control" name="sku" />
        </div>
        <div class="form-group">
          <label>Price</label>
          <input onChange={this.handlePriceUpdate} value={this.price} type="number" placeholder="00.00" class="form-control" name="price" />
        </div>
        <div class="form-group">          
          <button onClick={this.handleSubmit} type="submit" class="btn btn-primary">Save Variation</button>
        </div>
      </div>
  	)
  } 
}
</script>

<style lang="css" scoped>
</style>