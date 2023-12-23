function add_to_cart(pid, pname, price) {
    console.log("start...");
    let cart = localStorage.getItem("cart");
    if (cart == null) {
//        no cart yet
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
        products.push(product);
        // convert array to String ..
        localStorage.setItem("cart", JSON.stringify(products));
      
    }else {

        let pcart = JSON.parse(cart);       
        let oldproduct = pcart.find(o => o.productId === pid);
        if (oldproduct) {
            // we have to increase the quantity .'
            oldproduct.productQuantity = oldproduct.productQuantity + 1;
            pcart.map((item) => {
                if (item.productId == oldproduct.productId) {
                    item.productQuantity = oldproduct.productQuantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product quantity is increased")
        } else {
//            we have to add the product . 
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product is added");
        }
    }

    updateCart(); 


}



// update cart ..

var totalPrice = 0; 

function updateCart(){ 
    let cartString = localStorage.getItem("cart"); 
    let cart = JSON.parse(cartString); 
    if(cart==null|| cart.length===0){
        console.log("cart is empty"); 
        // jqury ..
        // value change hori hai 
        
        $(".cart-item").html("(0)"); 
        $(".cart-body").html("<h2>cart does not have any item</h2>");
         $(".checkout-btn").attr('disabled',true); 
        
        
    }else{
        $(".cart-item").html(`(${cart.length}`+")"); 
        
        let table = `
                <table class='table'>
        <thead class='thread-light'>
        <tr> 
        <th>Item Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total Price</th>
        <th>Action</th>
        </tr>
        </thead>
        `;
//      var totalPrice = 0; 
        cart.map((item)=>{
            table+= `
                    <tr>
            <td>${item.productName}</td>
            <td>${item.productPrice}</td>
            <td>${item.productQuantity}</td>
            <td>${item.productQuantity*item.productPrice}</td>
            <td><button onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm">Remove</button></td>
</tr>
           `;
              
            totalPrice+=item.productPrice*item.productQuantity  ;     
            
        })
        
        table = table+`</table>
        
<tr><td> <h5>Total Price : ${totalPrice}</h5></td></tr></table >`;
        
        $(".cart-body").html(table);
         $(".checkout-btn").attr('disabled',false); 
         
    }


}
//delete item
function deleteItemFromCart(pid){
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item)=>item.productId !=pid)
    localStorage.setItem('cart', JSON.stringify(newcart)) ;

    updateCart();
}


function goToCheckout(){
    window.location="checkout.jsp"; 
}



// first request to server to create order..

$(document).ready(function(){
    updateCart(); 
})


// sjdfakljsdfkjladsflkjadhfljkdshflkjsdfhjkla********************







var xhttp = new XMLHttpRequest() ; 
var RazorpayOredrId; 
function CreateOrderId(){
    xhttp.open("GET","http://localhost:2003/e-cart/PaymentServlet",false);
    xhttp.send(); 
    RazorpayOredrId = xhttp.responseText; 
    OpenCheckout();
  
}

    

function  OpenCheckout(){
    
    
   
  var customer_email = $(".your_email").val() ; 
    var customer_name = $(".your_name").val();
    var customer_no = $(".your_Number").val();  
    
        var options={
            "key" : "rzp_test_FeHwHeOvwF9X6r",
            "amount": totalPrice*100,
            "currency":"INR",
            "name":"My-cart",
            "description":"thanks for buying product ",
            "image":"img/users.png",
            "callback_url":"http://localhost:2003/e-cart/PaymentServlet",
            "prefill":{
                "name": customer_name,
                "email":customer_email,
                "contect":customer_no
            },
            
            "notes":{
                "address": "My-cart shop Corparate office",
                
            },
            "theme":{
                "color" : "#3399cc"
            }
            
        };
       var rzp1 = new window.Razorpay(options);
        rzp1.on('payment.failed',function(response){
            alert(response.error.code); 
            alert(response.error.description); 
            alert(response.error.source); 
            alert(response.error.step); 
            alert(response.error.reason); 
            alert(response.error.metadata.order_id); 
            alert(response.error.metadata.payment_id); 
            
        }); 
        rzp1.open();
        e.preventDefault(); 


}







