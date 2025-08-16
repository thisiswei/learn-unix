function calculateTotal(items) {
    let total = 0;
    for (let item of items) {
        total += item.price * item.quantity;
    }
    return total;
}

const processOrder = (order) => {
    console.log("Processing order:", order.id);
    const total = calculateTotal(order.items);
    return { ...order, total: total, status: "processed" };
};

module.exports = { calculateTotal, processOrder };
