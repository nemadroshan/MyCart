
//1st function
function checkQuantity(pquantity){
	console.log('inside check quantiy');
	console.log(typeof pquantity);
	var pquant = document.getElementById('pquant').value;
	
	console.log("pcont-------------->"+pquant)
	console.log(typeof pquantity);
	if(pquant == 0){
		alert("Product out of stock");
	}else if (pquantity>pquant) {
		alert("Limited Stock");
	}
	console.log('inside check quantiy ends');
  // alert(document.formName.elements['abcName'].value);
}

// 2nd function
function addToCart(pid,pname,price){
	console.log('inside java scripet');
	let cart = localStorage.getItem("cart");
	if(cart == null){
		// no cart
		// create product array
		let products=[ ];
		// create product object
		let product = {
				productId:pid,
				productName:pname,
				productPrice:price,
				productQuantity:1
		}
		// add product to product array
		products.push(product);

		// update to local storage
		var myJason = JSON.stringify(products);
		localStorage.setItem("cart",myJason);
		showTost("Item is added to cart");
		//console.log('product addded for first time');
		
	}else {
		// cart present
		let pcart=JSON.parse(cart); // this method gives paser jason to
		// respective format
		
		let oldproduct = pcart.find((item) => item.productId == pid);
		if(oldproduct){
			// only increase the quantity
			oldproduct.productQuantity= oldproduct.productQuantity+1;
			pcart.map((item)=>{
				if(item.productId == oldproduct.productId){
					item.productQuantity = oldproduct.productQuantity;
				}
			});
			
			localStorage.setItem("cart",JSON.stringify(pcart));
			showTost(" Quantity is increased");
			//console.log('product quantity is incrased');
			
		}
		else {
			// we have toadd quantity
			let product = {
					productId:pid,
					productName:pname,
					productPrice:price,
					productQuantity:1
			}
			pcart.push(product);
			localStorage.setItem("cart",JSON.stringify(pcart));
			showTost("product is added to cart");
			
			//console.log('product is added');
			
		}
	}
	updateCart();
}


//update cart

function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart =	JSON.parse(cartString);
	
	if(cart == null || cart.length == 0){
		console.log("cart is empty");
		$(".card-items").html("( 0 )");
		$(".cart-body").html("<h3> Cart is Empty !! </h3>");
		$(".checkout-btn").addClass("disabled");
	}
	else{
		//some thing in cart
		console.log("some thing in cart")
		$(".card-items").html(`(  ${cart.length} )`);
		
		let table =`
		<table class='table'>
			<thead class='thead-light'>
				<tr>
				<th> Item Name</th>
				<th> Quantity</th>
				<th>Price </th>
				<th>Total Price</th>
				<th>Action</th>
				</tr>
			</thead>
		
		`;
		
		let totalPrice=0;
		cart.map((item)=>{
			table += `
			<tr>
				<td>${item.productName}</td>
				<td>${item.productQuantity}</td>
				<td>${item.productPrice}</td>
				<td>${item.productQuantity * item.productPrice }</td>
				<td><button  onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger'>Remove</button</td>
			</tr>
			`
				totalPrice += item.productPrice*item.productQuantity;
		})
		
		
		table = table+`
		<tr>
				<td colspan='5' class='text-right font-weight-bold mt-2'>Total Price :: ${totalPrice}</td>
		</tr>
		</table>`;
		$(".cart-body").html(table);
	}
}

//delete item from cart
function deleteItemFromCart(pid){
	let cart=JSON.parse(localStorage.getItem('cart'));
	let newCart = cart.filter((item) => item.productId !=  pid)
	localStorage.setItem('cart',JSON.stringify(newCart))
	updateCart();
	showTost("Item is removed from cart");
}

$(document).ready(function () {
	updateCart()
})


//tost function
function showTost(content){
		$("#tost").addClass("display");
		$("#tost").html(content);
		setTimeout(()=>{
			$("#tost").removeClass("display");
		},2000);
	}