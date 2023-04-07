export default function WelcomePage() {
    return (
        <div className="h-screen flex flex-row bg-gray-100">
            <div className="w-3/4 bg-white p-8 rounded-l-lg shadow-md flex flex-col justify-center">
                <h1 className="text-[#232323] text-7xl font-bold mb-4">Welcome, Frederico Floryan</h1>
                <p className="text-4xl text-[#232323] mb-6">What do you want to do today?</p>
                <div className="mb-4">
                    <button className="bg-[#009393] rounded-3xl hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mr-4">
                        See Mortgage History
                    </button>
                    <button className="bg-[#009393] rounded-3xl hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Apply Another Mortgage
                    </button>
                </div>
                <button className="w-48 bg-red-500 rounded-3xl text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                    Logout
                </button>
            </div>
            <div className="w-1/4 bg-[#92dbd1] p-8 rounded-r-lg shadow-md flex flex-col items-center justify-center">
                <div className="bg-white p-4 rounded-lg mb-6">
                    <p className="text-lg text-[#009393] mb-2">Current amount due:</p>
                    <p className="text-2xl text-[#232323] font-bold">HKD $20,000</p>
                </div>
                <button className="bg-[#009393] hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mb-2">
                    Settle Interest
                </button>
                <p className="text-lg font-bold">Next interest due in 7 May 2023</p>
            </div>
        </div>
    );
}
