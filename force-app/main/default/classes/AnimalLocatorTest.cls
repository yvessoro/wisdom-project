@IsTest
private class AnimalLocatorTest {
	
	@IsTest
	static void testAnimalLocatorCallout() {
		 // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock.
        String name = AnimalLocator.getAnimalNameById(1);
        Assert.areEqual('chicken', name);
	}
}