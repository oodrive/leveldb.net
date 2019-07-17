using System;
using LevelDB;
using NUnit.Framework;

namespace DotNetFrameworkTests
{

    [TestFixture]
    public class NativeLibraryLoadingTests
    {
        [Test]
        public void Native_library_should_be_loaded()
        {
            try
            {
                using (new DB(new Options {CreateIfMissing = true}, "LoadingTest"))
                {
                    Assert.Pass();
                }
            }
            catch(Exception ex) when (!(ex is SuccessException))
            {
                Assert.Fail("Cannot create database: " + ex.Message);
            }
        }
    }
}
