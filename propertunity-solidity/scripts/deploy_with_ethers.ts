import { deploy } from './ethers-lib'

(async () => {
    try {
        const result = await deploy('PropNFT', [])
        console.log(`address: ${result.address}`)
        const res = await deploy('Pool', [])
        console.log(`address: ${res.address}`)
        const r = await deploy('PropCoin', [])
        console.log(`address: ${r.address}`)
    } catch (e) {
        console.log(e.message)
    }
  })()