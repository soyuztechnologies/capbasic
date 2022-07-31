module.exports = cds.service.impl( async function(){

    const {
        EmployeeSet, POs
    } = this.entities;

    this.before('UPDATE', EmployeeSet, (req,res) => {
        console.log("aaya kya", req.data.salaryAmount);
        if(parseFloat(req.data.salaryAmount) >= 1000000){
            req.error(500, "salary must be below 1 mn");
            //res.send("Dude, not allowed salary");
        }
    });

    this.on('boost', async req => {
        try {
            const ID = req.params[0];
            console.log("Your Purchase order with ID ---> " + ID + " will be Boosted");
            const tx = cds.tx(req);
            await tx.update(POs).with({
                GROSS_AMOUNT: { '+=' : 20000 }, NOTE: "Boosted!!"
            }).where(ID);
            return {};

        } catch (error) {
            return "Error " + error.toString();
        }
    });

    this.on('largestOrder', async req => {
        try {
            const ID = req.params[0];
            console.log("Your Purchase order with ID ---> " + ID + " will be Boosted");
            const tx = cds.tx(req);
            const reply = await tx.read(POs).orderBy({
                GROSS_AMOUNT: 'desc'
            }).limit(1);
            return reply;

        } catch (error) {
            return "Error " + error.toString();
        }
    });


});