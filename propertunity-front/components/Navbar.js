import Image from 'next/image'

export default function Navbar() {
    return (
        <div className="flex justify-between items-center px-52 py-4 bg-white">
            <div>
                <Image src="/logo.jpg" width={275} height={100} />
            </div>
            <div className='flex justify-evenly w-full text-gray-500'>
                <p><b><a>Why?</a></b></p>
                <p><b><a>Benefits</a></b></p>
                <p><b><a>Transparency</a></b></p>
                <p><b><a>About</a></b></p>
                <p><b><a>FAQ</a></b></p>
                <div className='text-[#009393]'>
                    <p><b><a>Sign In</a></b></p>
                </div>
            </div>
            <div>
            </div>
        </div>
    )
}